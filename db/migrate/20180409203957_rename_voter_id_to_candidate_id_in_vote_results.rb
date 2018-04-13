class RenameVoterIdToCandidateIdInVoteResults < ActiveRecord::Migration
  def change
    rename_column :candidate_masters, :voter_id, :candidate_id
  end
end
