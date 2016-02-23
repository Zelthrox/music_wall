class ChangeUserTable1 < ActiveRecord::Migration
  def change
     rename_table :add_users, :users
  end
end
