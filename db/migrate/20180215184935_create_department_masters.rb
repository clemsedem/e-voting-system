class CreateDepartmentMasters < ActiveRecord::Migration
  def change
    create_table :department_masters do |t|
      t.string :department_name
      t.integer :faculty_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
