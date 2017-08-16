class RenameColumnForUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :user_role_id, :role_id
  end
end
