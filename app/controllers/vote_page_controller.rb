class VotePageController < ApplicationController
  
   def president       
      @presidential_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.portfolio =?", 'President').paginate(:page => params[:page], :per_page => 5)
      logger.info @presidential_candidates.inspect
      @voter_token = params[:%]
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @presidential_candidates[0].portfolio_master.ref_id  
      
      @presidential_votes = VoteResult.where(voter_id: @voter_id, portfolio_id: 'P')[0]
      
      if  @presidential_votes.present?
         flash.now[:notice] = "You have already voted for presidential candidate!"
        redirect_to secretary_page_path(:% => @voter_token)
      end
        
   end
   
   
   def secretary      
      @secretary_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.portfolio =?", 'Secretary').paginate(:page => params[:page], :per_page => 5)
      logger.info @secretary_candidates.inspect
      @voter_token = params[:%]
      logger.info @voter_token.inspect
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @secretary_candidates[0].portfolio_master.ref_id  
      
       @secretary_votes = VoteResult.where(voter_id: @voter_id, portfolio_id: 'S')[0]
      
      if  @secretary_votes.present?
        flash.now[:notice] = "You have already voted for Secretarial candidate!"
         redirect_to treasurer_page_path(:% => @voter_token )
      end
       
   end
   
   
   def treasurer
     @treasurer_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.portfolio =?", 'Treasurer').paginate(:page => params[:page], :per_page => 5)
      logger.info @treasurer_candidates.inspect
       @voter_token = params[:%]
      logger.info @voter_token.inspect
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @treasurer_candidates[0].portfolio_master.ref_id  
      
      @treasurer_votes = VoteResult.where(voter_id: @voter_id, portfolio_id: 'TR')[0]
      
      if  @treasurer_votes.present?
        flash.now[:notice] = "You have already voted for Secretarial candidate!"
        redirect_to finacial_secretary_page_path(:% => @voter_token )
      end
     
   end
   
   
   def finacial_secretary
      @finance_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.ref_id =?", 'FS').paginate(:page => params[:page], :per_page => 5)
      logger.info @finance_candidates.inspect
       @voter_token = params[:%]
      logger.info @voter_token.inspect
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @finance_candidates[0].portfolio_master.ref_id  
      
      @finance_votes = VoteResult.where(voter_id: @voter_id, portfolio_id: 'FS')[0]
      
      if  @finance_votes.present?
        flash.now[:notice] = "You have already voted for Secretarial candidate!"
        redirect_to wocom_page_path(:% => @voter_token ) 
      end
     
   end
   
   
   def wocom
      @wocom_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.ref_id =?", 'WC').paginate(:page => params[:page], :per_page => 5)
      logger.info @wocom_candidates.inspect
      @voter_token = params[:%]
      logger.info @voter_token.inspect
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @wocom_candidates[0].portfolio_master.ref_id  
      
      @wocom_votes = VoteResult.where(voter_id: @voter_id, portfolio_id: 'WC')[0]
      
      if  @wocom_votes.present?
        flash.now[:notice] = "You have already voted for Secretarial candidate!"
        redirect_to root_path
      end
     
   end
   
   
   
   
   def submit_vote_result
     @portfolio_id = params[:portfolio]
     @candidate = params[:me]     
     @voter_token= params[:voter]     
     voter_in_token = VoterToken.where(token: @voter_token)[0]     
     @voter_id = voter_in_token.voter_id   
     
      already_voted_for_portfolio = VoteResult.where(voter_id: @voter_id, portfolio_id: @portfolio_id )[0]
           
            if already_voted_for_portfolio.present?
                if already_voted_for_portfolio.portfolio_id == 'P' or already_voted_for_portfolio.portfolio_id == 'NONE'
                    respond_to do |format|
                        format.html { redirect_to secretary_page_path(:% => @voter_token), notice: "You have already voted for this portfolio!" }
                     end
                elsif already_voted_for_portfolio.portfolio_id == 'S' or already_voted_for_portfolio.portfolio_id == 'NONE'
                     respond_to do |format|
                        format.html { redirect_to treasurer_page_path(:% => @voter_token), notice: "You have already voted for this portfolio!" }
                     end 
                elsif already_voted_for_portfolio.portfolio_id == 'TR' or already_voted_for_portfolio.portfolio_id == 'NONE'
                    respond_to do |format|
                      format.html { redirect_to finacial_secretary_page_path(:% => @voter_token), notice: "You have already voted for this portfolio!" }
                   end
                 elsif already_voted_for_portfolio.portfolio_id == 'FS' or already_voted_for_portfolio.portfolio_id == 'NONE'
                     respond_to do |format|
                        format.html { redirect_to wocom_page_path(:% => @voter_token), notice: "You have already voted for this portfolio!" }
                     end
                elsif already_voted_for_portfolio.portfolio_id == 'WC' 
                    respond_to do |format|
                          format.html { redirect_to root_path, notice: "Thanks for passing by!! Remember your vote is your power." }
                       end
                end
            # end
            
     
     
     
     
     elsif @portfolio_id && @candidate && @voter_id
       check_voter = RegisteredVoter.where(voter_id: @voter_id)
       
       if check_voter.present?
          check_candidate = CandidateMaster.joins(:registered_voter).where("registered_voters.voter_id =?", @candidate)
          if check_candidate.present? or @candidate == 'NONE'           
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
                    get_voter = RegisteredVoter.where(voter_id: @voter_id)[0]
                    logger.info "Voter that has finished voting #{get_voter.inspect}"
                 
                    update_vote_status = get_voter.update(
                            vote_status: true
                       )
                     
                         respond_to do |format|
                          format.html { redirect_to root_path, notice: "Thanks for passing by!! Remember your vote is your power." }
                       end
                    
               
               elsif @portfolio_id == 'P' 
                   respond_to do |format|
                      format.html { redirect_to secretary_page_path(:% => @voter_token) }
                   end
                   
               elsif @portfolio_id == 'S' 
                    respond_to do |format|
                      format.html { redirect_to treasurer_page_path(:% => @voter_token) }
                   end
                   
              elsif @portfolio_id == 'TR' 
                    respond_to do |format|
                      format.html { redirect_to finacial_secretary_page_path(:% => @voter_token) }
                   end
                   
               elsif @portfolio_id == 'FS' 
                    respond_to do |format|
                      format.html { redirect_to wocom_page_path(:% => @voter_token) }
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
