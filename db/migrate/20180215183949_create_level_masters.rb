class CreateLevelMasters < ActiveRecord::Migration
  def change
    create_table :level_masters do |t|
      t.integer :level
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
