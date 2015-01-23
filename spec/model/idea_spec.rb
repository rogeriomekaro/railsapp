require "spec_helper"
require "factory_girl"
require "factories"
require "idea"
require "comment"

describe Idea do
	
	before :all do
		@idea = FactoryGirl.build(:idea)		
		#@idea = Idea.new("rogers","Alpha",100)
  	end

	it "name should have more than 5 letters" do
		@idea.name.length.should be > 5
	end

	it "description should starts with 'A" do
		@idea.description_starts_with?("A").should == true
	end
	
	it "value should be smaller 100" do
		@idea.value.should < 100
	end
end

describe Comment do

	it "validate if user_name is different of nil" do
		c = Comment.new("roger")
		c.user_name.should_not nil
	end

end

