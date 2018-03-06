class AddSurnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :surname, :string
    add_column :users, :other_names, :string
    add_column :users, :username, :string
  end
end
