class ChangeGenderToStringInRegisteredVoters < ActiveRecord::Migration
  def change
    change_column :registered_voters, :gender, :string
  end
end
