class AddSlotIdToCandidateMaster < ActiveRecord::Migration
  def change
    add_column :candidate_masters, :slot_id, :integer
  end
end
