require "rails_helper"

describe Comment do

	before :all do
		@comment = FactoryGirl.build(:comment)
  	end

  	it "should have a valid factory" do
  		expect(@comment).to be_valid
  	end

	it "should contains no more than 30 chars" do
		@comment.body = "zxcvb zxcvb zxcvb zxcvb zxcvb zxcvb"
		expect(@comment).to_not be_valid
	end

	it "should remove spaces from the string end" do
		invalid_body = "daidhiaiodhids  "
		@comment.body = invalid_body
		@comment.save
		expect(@comment.body).to eq(invalid_body.rstrip) 
	end

	context	"associated_keys" do
		before do
			@idea = FactoryGirl.create(:idea)
			@user = FactoryGirl.create(:user)
		end

		it "should contain a idea associated" do
			@comment.idea_id = nil
			expect(@comment).to_not be_valid
		end

		it "should contain a user associated" do
			@comment.user_id = nil
			expect(@comment).to_not be_valid
		end

	end



end