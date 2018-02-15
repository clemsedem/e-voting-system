class CreatePortfolioMasters < ActiveRecord::Migration
  def change
    create_table :portfolio_masters do |t|
      t.string :ref_id
      t.string :portfolio
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
