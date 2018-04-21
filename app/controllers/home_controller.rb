class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    # President  
    @prez_chart = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'P', 'P_NONE').group(:candidate_id).count(:voter_id)
    
    # Secretary
     @sec_chart = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'S', 'SEC_NONE').group(:candidate_id).count(:voter_id)

     # Treasurer
     @tr_chart = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'TR', 'TR_NONE').group(:candidate_id).count(:voter_id)
     
     # Financial Secretary
     @fs_chart = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'FS', 'FS_NONE').group(:candidate_id).count(:voter_id)
     
     # wocom
     @wc_chart = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'WC', 'WC_NONE').group(:candidate_id).count(:voter_id)
         
  end 
  
end
