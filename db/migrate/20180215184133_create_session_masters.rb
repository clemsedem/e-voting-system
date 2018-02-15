class CreateSessionMasters < ActiveRecord::Migration
  def change
    create_table :session_masters do |t|
      t.string :session
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
