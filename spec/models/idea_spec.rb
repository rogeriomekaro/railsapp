require "rails_helper"
require 'carrierwave/test/matchers'


describe Idea do
	
	before :all do
		@idea = build(:idea)		
  	end

  	it "should have a valid factory" do
  		expect(build(:idea)).to be_valid
  	end

	it "name should have more than 5 letters" do
		@idea.name = "abc"
		expect(@idea).to_not be_valid
	end

	it "should have a User associated" do
		@idea.user = nil
		expect(@idea).to_not be_valid
	end

	it "should contains a thumb version" do
	    pending("this will be implemented")
	    raise ""
	end

	it "should increments likes +1" do
		count = @idea.likes_count
		@idea.increment!(:likes_count,1)
		expect(@idea.reload.likes_count).to eq(count+1)
	end

	it "should decrements likes -1" do
		count = @idea.likes_count
		@idea.decrement!(:likes_count,1)
		expect(@idea.reload.likes_count).to eq(count-1)
	end

	context "#with_description" do
		before do
			@ideas_with_description = create_list(:idea, 3)
			@ideas_without_description = create_list(:idea, 3, description: nil)
		end

		it "should list only ideas with description" do
			expect(Idea.with_description).to match_array(@ideas_with_description)
			expect(Idea.with_description.count).to_not eq(Idea.count)
			expect(Idea.with_description.first.description).to_not be_nil
		end
	end

	context "#with_picture" do
		before do
			 @ideas_with_picture = create_list(:idea, 3)
			 @ideas_without_picture = create_list(:idea, 3, picture: nil)
		end

		it "should list only ideas with picture" do	
			expect(Idea.with_picture).to match_array(@ideas_with_picture)
			expect(Idea.with_picture.count).to_not eq(Idea.count)
			expect(Idea.with_picture.first.picture).to_not be_nil
		end
	end

	context "#without_description" do
		before do
			@ideas_with_description = create_list(:idea, 3)
			@ideas_without_description = create_list(:idea, 3, description: nil)
		end

		it "should list only ideas without description" do 
			expect(Idea.without_description).to_not match_array(@ideas_without_description)
			expect(Idea.without_description.count).to_not eq(Idea.count)
			expect(Idea.without_description.first).to be_nil
		end
	end

	context "#without_picture" do
		before do
			 @ideas_with_picture = create_list(:idea, 3)
			 @ideas_without_picture = create_list(:idea, 3, picture: nil)
		end

		it "should list only ideas without picture" do	
			expect(Idea.without_picture).to_not match_array(@ideas_without_picture)
			expect(Idea.without_picture.count).to_not eq(Idea.count)
			expect(Idea.without_picture.first).to be_nil
		end
	end


end