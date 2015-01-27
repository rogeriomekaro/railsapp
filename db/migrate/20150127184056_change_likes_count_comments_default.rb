class ChangeLikesCountCommentsDefault < ActiveRecord::Migration
  def change
  	change_column :comments, :likes_count, :integer, :default => 0
  end
end
