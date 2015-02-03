require 'rails_helper'

describe Like do

  before :all do
    @like = build(:like)    
  end

  it "should have a valid factory" do
    expect(@like).to be_valid
  end

  it "should have a user associated" do
    @like.user_id = nil
    expect(@like).to_not be_valid
  end

  it "should have a object type associated" do
    @like.object_type = nil
    expect(@like).to_not be_valid
  end

  it "should have a object id associated" do
    @like.object_id = nil
    expect(@like).to_not be_valid
  end

  before do
    create(:like)
  end

  it "user can't like the same object 2 times" do
    expect(@like).to_not be_valid
  end

end
