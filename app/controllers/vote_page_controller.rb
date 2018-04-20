class VotePageController < ApplicationController
  
   def president       
      @presidential_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.portfolio =?", 'President').paginate(:page => params[:page], :per_page => 5).order('candidate_masters.slot_id asc')
      logger.info @presidential_candidates.inspect
      @voter_token = params[:%]
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @presidential_candidates[0].portfolio_master.ref_id  
      
      @presidential_votes = VoteResult.where('voter_id =? AND (portfolio_id =? OR portfolio_id =?) ',  @voter_id,  'P', 'P_NONE')[0]
      
      if  @presidential_votes.present?
         respond_to do |format|
            format.html { redirect_to secretary_page_path(:% => @voter_token), notice: "You have already voted for presidential candidate!" }
         end
         # redirect_to secretary_page_path(:% => @voter_token)
         # flash.now[:notice] = "You have already voted for presidential candidate!"
      end
        
   end
   
   
   def secretary      
      @secretary_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.portfolio =?", 'Secretary').paginate(:page => params[:page], :per_page => 5).order('candidate_masters.slot_id asc')
      logger.info @secretary_candidates.inspect
      @voter_token = params[:%]
      logger.info @voter_token.inspect
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @secretary_candidates[0].portfolio_master.ref_id  
      
       @secretary_votes = VoteResult.where('voter_id =? AND (portfolio_id =? OR portfolio_id =?) ',  @voter_id,  'S', 'SEC_NONE')[0]
      
      if  @secretary_votes.present?
          respond_to do |format|
            format.html { redirect_to treasurer_page_path(:% => @voter_token ), notice: "You have already voted for Secretarial candidate!" }
         end
         # redirect_to treasurer_page_path(:% => @voter_token )
         # flash.now[:notice] = "You have already voted for Secretarial candidate!"
      end
       
   end
   
   
   def treasurer
     @treasurer_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.portfolio =?", 'Treasurer').paginate(:page => params[:page], :per_page => 5).order('candidate_masters.slot_id asc')
      logger.info @treasurer_candidates.inspect
       @voter_token = params[:%]
      logger.info @voter_token.inspect
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @treasurer_candidates[0].portfolio_master.ref_id  
      
      @treasurer_votes = VoteResult.where('voter_id =? AND (portfolio_id =? OR portfolio_id =?) ',  @voter_id,  'TR', 'TR_NONE')[0]
      
      if  @treasurer_votes.present?
        respond_to do |format|
            format.html { redirect_to finacial_secretary_page_path(:% => @voter_token ), notice: "You have already voted for a  Treasurer" }
         end
        # redirect_to finacial_secretary_page_path(:% => @voter_token )
        # flash.now[:notice] = "You have already voted for Secretarial candidate!"
      end
     
   end
   
   
   def finacial_secretary
      @finance_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.ref_id =?", 'FS').paginate(:page => params[:page], :per_page => 5).order('candidate_masters.slot_id asc')
      logger.info @finance_candidates.inspect
       @voter_token = params[:%]
      logger.info @voter_token.inspect
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @finance_candidates[0].portfolio_master.ref_id  
      
      @finance_votes = VoteResult.where('voter_id =? AND (portfolio_id =? OR portfolio_id =?) ',  @voter_id,  'FS', 'FS_NONE')[0]
      
      if  @finance_votes.present?
        respond_to do |format|
            format.html { redirect_to wocom_page_path(:% => @voter_token ), notice: "You have already voted for a  Financial Secretary" }
         end
        # redirect_to wocom_page_path(:% => @voter_token ) 
        # flash.now[:notice] = "You have already voted for Secretarial candidate!"
      end
     
   end
   
   
   def wocom
      @wocom_candidates = CandidateMaster.joins(:portfolio_master).where("portfolio_masters.ref_id =?", 'WC').paginate(:page => params[:page], :per_page => 5).order('candidate_masters.slot_id asc')
      logger.info @wocom_candidates.inspect
      @voter_token = params[:%]
      logger.info @voter_token.inspect
      voter_in_token = VoterToken.where(token: @voter_token)[0]
      @voter_id = voter_in_token.voter_id   
      @portfolio_id = @wocom_candidates[0].portfolio_master.ref_id  
      
      @wocom_votes = VoteResult.where('voter_id =? AND (portfolio_id =? OR portfolio_id =?) ',  @voter_id,  'WC', 'WC_NONE')[0]
      
      if  @wocom_votes.present?
         respond_to do |format|
            format.html { redirect_to root_path, notice: "You have already voted!" }
         end
        # redirect_to root_path
        # flash.now[:notice] = "You have already voted for Secretarial candidate!"
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
                if already_voted_for_portfolio.portfolio_id == 'P' or already_voted_for_portfolio.portfolio_id == 'P_NONE'
                    respond_to do |format|
                        format.html { redirect_to secretary_page_path(:% => @voter_token), notice: "You have already voted for this portfolio!" }
                     end
                elsif already_voted_for_portfolio.portfolio_id == 'S' or already_voted_for_portfolio.portfolio_id == 'SEC_NONE'
                     respond_to do |format|
                        format.html { redirect_to treasurer_page_path(:% => @voter_token), notice: "You have already voted for this portfolio!" }
                     end 
                elsif already_voted_for_portfolio.portfolio_id == 'TR' or already_voted_for_portfolio.portfolio_id == 'TR_NONE'
                    respond_to do |format|
                      format.html { redirect_to finacial_secretary_page_path(:% => @voter_token), notice: "You have already voted for this portfolio!" }
                   end
                 elsif already_voted_for_portfolio.portfolio_id == 'FS' or already_voted_for_portfolio.portfolio_id == 'FS_NONE'
                     respond_to do |format|
                        format.html { redirect_to wocom_page_path(:% => @voter_token), notice: "You have already voted for this portfolio!" }
                     end
                elsif already_voted_for_portfolio.portfolio_id == 'WC'  or already_voted_for_portfolio.portfolio_id == 'WC_NONE'
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
              if  @candidate == 'NONE'
                slot_id = 0  
              else
                slot_id = check_candidate[0].slot_id   
              end
                     
             vote_result = VoteResult.new(
              portfolio_id: @portfolio_id,
              voter_id:  @voter_id,
              candidate_id: @candidate,
              active_status: 1, 
              del_status: 0,
              slot: slot_id
             )
                        
            if vote_result.save
              # vote redirect
               if @portfolio_id == 'WC' or @portfolio_id == 'WC_NONE'
                    get_voter = RegisteredVoter.where(voter_id: @voter_id)[0]
                    logger.info "Voter that has finished voting #{get_voter.inspect}"
                    get_voter_token = VoterToken.where(voter_id: @voter_id, active_status: true)[0]
                 
                    update_vote_status = get_voter.update(
                            vote_status: true
                       )
                    update_token_status = get_voter_token.update(
                          active_status: false
                      )
                     
                         respond_to do |format|
                          format.html { redirect_to root_path, notice: "Thanks for passing by!! Remember your vote is your power." }
                       end
                    
               
               elsif @portfolio_id == 'P' or @portfolio_id == 'P_NONE' 
                   respond_to do |format|
                      format.html { redirect_to secretary_page_path(:% => @voter_token) }
                   end
                   
               elsif @portfolio_id == 'S' or @portfolio_id == 'SEC_NONE'
                    respond_to do |format|
                      format.html { redirect_to treasurer_page_path(:% => @voter_token) }
                   end
                   
              elsif @portfolio_id == 'TR' or @portfolio_id == 'TR_NONE'
                    respond_to do |format|
                      format.html { redirect_to finacial_secretary_page_path(:% => @voter_token) }
                   end
                   
               elsif @portfolio_id == 'FS' or @portfolio_id == 'FS_NONE'
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
