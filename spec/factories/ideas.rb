FactoryGirl.define do
	factory :idea do
		name "rogers"
		description "Alpha"
		user_id 1
		likes_count 0
		# value 50

		# factory :idea_without_description do
		# 	description nil
		# end
	end
end