class Idea < ActiveRecord::Base
	
  mount_uploader :picture, PictureUploader

	has_many :comments
  belongs_to :user

  scope :with_description, -> { where.not(description: :null) }
  scope :without_description, -> { where(description: :null) }

  scope :with_picture, -> { where.not(picture: :null) }
  scope :without_picture, -> { where(picture: :null) } 

  validates :name, length: {minimum: 5}
  validates :user_id , presence: true

  def increment_like_count
    increment(:likes_count, 1)
  end

  def increment_like_count!
    self.increment_like_count
    self.save
  end

  def decrement_like_count
    decrement(:likes_count,1)
  end

  def decrement_like_count!
    self.decrement_like_count
    self.save
  end
end
