class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :obj, polymorphic: true

  validates :user_id, :obj_type, :obj_id, presence: true
  validates_uniqueness_of :user_id, scope: [:obj_type, :obj_id]

end