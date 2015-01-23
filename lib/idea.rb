class Idea

	attr_accessor :name, :description, :value

	def initialize(name = "", description = "", value = 0)
		@name = name
		@description = description
		@value = value
	end
	
	def description_starts_with?(a)
		return @description.start_with?(a)
	end

end
