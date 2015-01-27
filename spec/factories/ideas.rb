FactoryGirl.define do
	factory :idea do
		name "rogers"
		description "Alpha"
  		picture { File.new(Rails.root.join('app', 'assets', 'images', 'seta.png')) }
		user_id 1
	end
end