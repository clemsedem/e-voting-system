class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :active_status
      t.boolean :del_status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
