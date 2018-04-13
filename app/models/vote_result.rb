class VoteResult < ActiveRecord::Base
  
  belongs_to :portfolio_master, class_name: 'PortfolioMaster', foreign_key: :portfolio_id 
  
  belongs_to :candidate_master, class_name: 'CandidateMaster', foreign_key: :candidate_id
  
  belongs_to :registered_voter, class_name: 'RegisteredVoter', foreign_key: :voter_id
    
end