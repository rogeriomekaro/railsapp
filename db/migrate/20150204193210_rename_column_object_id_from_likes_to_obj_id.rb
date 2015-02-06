class RenameColumnObjectIdFromLikesToObjId < ActiveRecord::Migration
  def change
    rename_column :likes, :object_id, :obj_id
  end
end
