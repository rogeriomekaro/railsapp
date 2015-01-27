class Comment < ActiveRecord::Base

	belongs_to :idea
	belongs_to :user

	validates :idea_id, :user_id, presence: true
	validates :body, length: {maximum: 30}, presence: true

	before_save :sanitize_body

	private
	def sanitize_body
		self.body.rstrip!
	end

    def increment_like_count
      self.likes_count += 1
    end

    def decrement_like_count
      self.likes_count -= 1
    end

end
