class VoteCastPageController < ApplicationController
  
  
  def voter_valid
    
    respond_to do |format| 
      format.js 
      format.html
    end
  end 
  
  
  def validate_voter
     @voter_id = params[:voter_id]
     @voter_token = params[:voter_token]     
     @encrypted_token = Digest::SHA256.hexdigest(@voter_token)    
     logger.info "This is the voter id #{@voter_id.inspect}"
     logger.info "This is the voter token #{@voter_token.inspect}"
     
     if @voter_id && @voter_token && @encrypted_token
        @token_and_voter_exist = VoterToken.where(voter_id: @voter_id, token: @encrypted_token)[0]
       
       if @token_and_voter_exist
         # flash.now[:notice] = "Exists"
         @voter = RegisteredVoter.where(voter_id: @voter_id, active_status: true )[0]
         
         if @voter
           if @voter.vote_status == true
             flash.now[:notice] = "Sorry you have already voted!!"
           
           elsif @voter.nil?
             flash.now[:notice] = "Sorry the voter does not exists!" 
           else
             # flash.now[:notice] = "Good to go!!!"
            
            respond_to do |format|
              format.html { redirect_to president_page_path(:% => @encrypted_token) }
            end
            
           end
         else
           flash.now[:notice] = "Sorry the voter does not exists!"  
        end 
         
       else
          flash.now[:notice] = "Invalid voter ID or Code"
          # redirect_to voter_page_path
         # respond_to do |format|
            # format.html { redirect_to voter_page_path, notice: 'Level master was successfully created.' }
           
          # end
         
       end
       
     end
    
    
   
    
 end
  
  
  
end
