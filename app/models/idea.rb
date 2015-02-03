class Idea < ActiveRecord::Base
	
  include Likeable

  mount_uploader :picture, PictureUploader

	has_many :comments
  belongs_to :user
  has_many :likes,as: :object

  scope :with_picture, -> { where.not(picture: :null) }
  scope :without_picture, -> { where(picture: :null) } 

  scope :with_description, -> { where.not(description: :null) }
  scope :without_description, -> { where(description: :null) }

  validates :name, length: {minimum: 5}
  validates :user_id , presence: true

end
