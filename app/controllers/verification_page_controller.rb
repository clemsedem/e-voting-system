class VerificationPageController < ApplicationController
  def index
  end
  
  
  def verify_voter
    
    @voter_id = params[:voter_id].strip
    logger.info "This is the voter id #{@voter_id.inspect}"

    @voter = RegisteredVoter.where(voter_id: @voter_id, active_status: true )[0]
    @voter_token = VoterToken.where(voter_id: @voter_id, active_status: true)[0]
   
    if @voter.nil?
      flash.now[:notice] = "Sorry the voter with ID #{@voter_id} is not a registered voter!!"
           
    elsif @voter.vote_status == true
      flash.now[:notice] = "Sorry the voter with ID #{@voter_id} has already voted!!"
      
    elsif @voter_token
      flash.now[:notice] = "Sorry the voter with ID #{@voter_id} has already been verified!!"
      
    else
      o = [('a'..'z'), (1..9), ('A'..'Z')].map(&:to_a).flatten
      @user_token = (0...5).map { o[rand(o.length)] }.join
      logger.info "Token is  #{@user_token.inspect}"
      @real_voter_id = @voter.voter_id     
      @encrypted_token = Digest::SHA256.hexdigest(@user_token)
      logger.info " Encrypted Token is  #{@encrypted_tokenear.inspect}"
      
      if @user_token && @encrypted_token
          # flash.now[:notice] = "Sure!!"
          logger.info "Now insert into the token table"
        token = VoterToken.new(
            voter_id: @real_voter_id,
            token: @encrypted_token,
            active_status: true,
            del_status: false
          )
          
          token.save!
          
      end
      
      
    end
    
   
  end
  
  
end
