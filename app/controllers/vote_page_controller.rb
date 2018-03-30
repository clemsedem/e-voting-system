class VotePageController < ApplicationController
  
   def president       
      @presidential_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.portfolio =?", 'President').paginate(:page => params[:page], :per_page => 5)
      logger.info @presidential_candidates.inspect
      @voter_token = params[:%]
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @presidential_candidates[0].portfolio_master.ref_id   
   end
   
   def submit_vote_result
     @portfolio_id = params[:portfolio]
     @candidate = params[:me]     
     @voter_token= params[:voter]     
     voter_in_token = VoterToken.where(token: @voter_token)[0]     
     @voter_id = voter_in_token.voter_id   
     
     if @portfolio_id && @candidate && @voter_id
       check_voter = RegisteredVoter.where(voter_id: @voter_id)
       if check_voter.nil?
          check_candidate = CandidateMaster.joins(:registered_voter).where("registered_voters.voter_id =?", @candidate)
          if check_candidate.nil?
             vote_result = VoteResult.new(
              portfolio_id: @portfolio_id,
              voter_id:  @voter_id,
              candidate_id: @candidate,
              active_status: 1, 
              del_status: 0
             )
            
            if vote_result.save
              # vote redirect
               if @portfolio_id == 'WC'
                  RegisteredVoter.update_attribute(
                    vote_status: true
                   )
                  
                   respond_to do |format|
                    format.html { redirect_to root_path, notice: "Thanks for passing by!! Remember your vote is your power." }
                 end
                 
               elsif @portfolio_id == 'P'
                   respond_to do |format|
                      format.html { redirect_to root_path, notice: "Thanks for passing by!! Remember your vote is your power." }
                   end
                 
               end
                # end of vote redirect
            end
              
          else
            respond_to do |format|
              format.html { redirect_to root_path, notice: "Sorry the candidate does not exists!" }
            end
          end
         
       else
         # flash.now[:notice] = "Sorry the voter does not exists!" 
            respond_to do |format|
              format.html { redirect_to root_path, notice: "Sorry the voter does not exists!" }
            end
       end
       
     end
         
   end
   
  
end
