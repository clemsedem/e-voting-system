class RemoveIndexOnEmail < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.execute("DROP INDEX index_users_on_email")
  end
end
