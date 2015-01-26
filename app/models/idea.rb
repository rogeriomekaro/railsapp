class Idea < ActiveRecord::Base
	
  mount_uploader :picture, PictureUploader

	has_many :comments
  has_one :user

  attr_accessor :like_count

	# attr_accessible :name, :description, :value

 # scope :with_description, -> { where("description is not null") }
  scope :with_description, -> { where.not(description: :null) }
  scope :without_description, -> { where(description: :null) }

  # sql = "select * from comments where description is not null"

  validates :name, length: {minimum: 5}
  validates :user_id , presence: true

  after_save :picture_contains_thumb?

  def picture_contains_thumb?
    @thumb = self.picture.url(:thumb)

    if @thumb == nil
      return false
    end

    array = @thumb.split('/')
    return array[array.length-1].start_with?("thumb")
  
  end

  def increment_like_count
    self.likes_count += 1
  end

  def decrement_like_count
    self.likes_count -= 1
  end

  def with_picture
    @ideas = Idea.where.not(picture: :null)
  end

  def without_picture
    @ideas = Idea.where(picture: :null)
  end

end
