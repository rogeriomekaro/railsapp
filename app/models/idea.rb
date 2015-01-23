class Idea < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	has_many :comments

	attr_accessor :name, :description, :value

	def initialize
		@name = "rogers"
		@description = "description"
		@value = 50
	end
end
