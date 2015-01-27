class Comment < ActiveRecord::Base

	belongs_to :idea
	belongs_to :user

	validates :idea_id, :user_id, presence: true
	validates :body, length: {maximum: 30}, presence: true

	before_save :sanitize_body

	  def increment_like_count
	    increment(:likes_count, 1)
	  end

	  def increment_like_count!
	    self.increment_like_count
	    self.update_like_count
	  end

	  def decrement_like_count
	    decrement(:likes_count,1)
	  end

	  def decrement_like_count!
	    self.decrement_like_count
	    self.update_like_count
	  end

	  def update_like_count
	    update_attribute(:likes_count, self.likes_count)
	  end

	private
	def sanitize_body
		self.body.rstrip!
	end

end
