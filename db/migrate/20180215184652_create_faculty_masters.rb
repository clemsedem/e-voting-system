class CreateFacultyMasters < ActiveRecord::Migration
  def change
    create_table :faculty_masters do |t|
      t.string :faculty_name
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
