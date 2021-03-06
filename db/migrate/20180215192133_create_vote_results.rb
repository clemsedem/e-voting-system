class CreateVoteResults < ActiveRecord::Migration
  def change
    create_table :vote_results do |t|
      t.string :portfolio_id
      t.string :voter_id
      t.integer :candidate_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
