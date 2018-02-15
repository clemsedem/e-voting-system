class CreateVoterTokens < ActiveRecord::Migration
  def change
    create_table :voter_tokens do |t|
      t.string :voter_id
      t.string :token
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
