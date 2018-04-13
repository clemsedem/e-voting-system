class ChangeCandidateIdTypeToStringInVoteResult < ActiveRecord::Migration
  def change
    change_column :vote_results, :candidate_id, :string
  end
end
