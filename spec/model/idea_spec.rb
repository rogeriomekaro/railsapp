require "rails_helper"

describe Idea do
	
	before :all do
		@idea = FactoryGirl.build(:idea)		
  	end

  	it "should have a valid factory" do
  		expect(FactoryGirl.build(:idea)).to be_valid
  	end

	it "name should have more than 5 letters" do
		@idea.name = "abc"
		expect(@idea).to_not be_valid
	end

	it "should have a User associated" do
		@user = FactoryGirl.create(:user)
		@idea.user = nil
		expect(@idea).to_not be_valid
	end

	it "should contains a thumb version" do
		expect(@idea).to_not be_valid
	end

	it "should increments likes +1" do
		count = @idea.likes_count
		@idea.increment_like_count
		expect(@idea.likes_count).to eq(count+1)
	end

	it "should decrements likes -1" do
		count = @idea.likes_count
		@idea.decrement_like_count
		expect(@idea.likes_count).to eq(count-1)
	end

	context "with_description" do
		before do
			@ideas_with_description = FactoryGirl.create_list(:idea, 6)
			@ideas_without_description = FactoryGirl.create_list(:idea, 6, description: nil)
		end

		it "should list only ideas with description" do
			expect(Idea.with_description).to match_array(@ideas_with_description)
			expect(Idea.with_description.count).to_not eq(Idea.count)
			expect(Idea.with_description.first.description).to_not be_nil
		end
	end
end