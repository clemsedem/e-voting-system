class CreateGenderMasters < ActiveRecord::Migration
  def change
    create_table :gender_masters do |t|
      t.string :gender
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
