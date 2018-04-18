class AddSlotToVoteResults < ActiveRecord::Migration
  def change
    add_column :vote_results, :slot, :integer
  end
end
