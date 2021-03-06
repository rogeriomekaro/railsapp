class Comment < ActiveRecord::Base

  include Likeable

	belongs_to :idea
	belongs_to :user
 	# has_many :likes, as: :objects

	validates :idea_id, :user_id, presence: true
	validates :body, length: {maximum: 30}, presence: true

	before_save :sanitize_body

	private
	def sanitize_body
		self.body.rstrip!
	end

end
