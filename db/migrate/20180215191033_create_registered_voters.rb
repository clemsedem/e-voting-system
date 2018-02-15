class CreateRegisteredVoters < ActiveRecord::Migration
  def change
    create_table :registered_voters do |t|
      t.string :voter_id
      t.string :surname
      t.string :other_names
      t.integer :level_id
      t.integer :session_id
      t.integer :program_id
      t.integer :gender_id
      t.boolean :vote_status
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
