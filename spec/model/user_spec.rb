require "rails_helper"

describe User do
	
	before :all do
		@user = FactoryGirl.build(:user)		
  	end

  	it "should have a valid factory" do
  		expect(FactoryGirl.build(:user)).to be_valid
  	end

	it "should have a name with only letters" do
		@user.name = "222"
		expect(@user).to_not be_valid
	end
	
	it "should have a last name with only letters" do
		@user.last_name = "22"
		expect(@user).to_not be_valid
	end

	it "should have a valid email" do
		@user.email = "roger"
		expect(@user).to_not be_valid
	end

end
