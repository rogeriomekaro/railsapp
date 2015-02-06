class RenameColumnObjectTypeFromLikesToObjType < ActiveRecord::Migration
  def change
    rename_column :likes, :object_type, :obj_type
  end
end
