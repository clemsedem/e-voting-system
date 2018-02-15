class CreateCandidateMasters < ActiveRecord::Migration
  def change
    create_table :candidate_masters do |t|
      t.string :voter_id
      t.string :portfolio_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
