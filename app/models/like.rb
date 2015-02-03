class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :object, polymorphic: true

  validates :user_id, :object_type, :object_id, presence: true
  validates_uniqueness_of :user_id, scope: [:object_type, :object_id]

end
