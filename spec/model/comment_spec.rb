require "rails_helper"

describe Comment do

	before :all do
		@comment = create(:comment)
  	end

  	it "should have a valid factory" do
  		expect(@comment).to be_valid
  	end

	it "should not have a body that contains more than 30 chars" do
		@comment.body = "zxcvb zxcvb zxcvb zxcvb zxcvb zxcvb"
		expect(@comment).to_not be_valid
	end

	it "should remove spaces from the string end" do
		invalid_body = "daidhiaiodhids  "
		@comment.body = invalid_body
		@comment.save
		expect(@comment.body).to eq(invalid_body.rstrip) 
	end

	it "should increments likes +1" do
		count = @comment.likes_count
		@comment.increment_like_count!
		expect(@comment.reload.likes_count).to eq(count+1)
	end

	it "should decrements likes -1" do
		count = @comment.likes_count
		@comment.decrement_like_count!
		expect(@comment.reload.likes_count).to eq(count-1)
	end

	context	"associated_keys" do

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