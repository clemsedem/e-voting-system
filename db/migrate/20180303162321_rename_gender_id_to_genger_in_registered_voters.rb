class RenameGenderIdToGengerInRegisteredVoters < ActiveRecord::Migration
  def change
    rename_column :registered_voters, :gender_id, :gender
  end
end
