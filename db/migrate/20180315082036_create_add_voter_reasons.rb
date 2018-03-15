class CreateAddVoterReasons < ActiveRecord::Migration
  def change
    create_table :add_voter_reasons do |t|
      t.string :reason
      t.string :user_id
      t.string :voter_id

      t.timestamps null: false
    end
  end
end
