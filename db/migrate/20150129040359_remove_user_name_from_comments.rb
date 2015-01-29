class RemoveUserNameFromComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :user_name
  end
end
