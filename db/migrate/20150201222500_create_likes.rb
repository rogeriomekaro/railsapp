class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end
  end
end
