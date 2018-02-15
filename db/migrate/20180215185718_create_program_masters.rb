class CreateProgramMasters < ActiveRecord::Migration
  def change
    create_table :program_masters do |t|
      t.string :program_name
      t.string :department_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
