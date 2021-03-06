require "rails_helper"

describe User do
	
	before :all do
		@user = build(:user)		
  	end

  	it "should have a valid factory" do
  		expect(build(:user)).to be_valid
  	end

	it "should have a name with only letters" do
		@user.name = "aaa2222a22a2"
		expect(@user).to_not be_valid
	end
	
	it "should have a last name with only letters" do
		@user.last_name = "aaa2222a22a2"
		expect(@user).to_not be_valid
	end

	it "should have a valid email" do
		@user.email = "roger"
		expect(@user).to_not be_valid
	end

	context "full_name" do 

		it "should have a valid full name" do
			expect(@user.full_name).to eq(@user.name + " " + @user.last_name)
		end

	end

end
