require 'rails_helper'

RSpec.describe "likes/new", :type => :view do
  before(:each) do
    assign(:like, Like.new(
      :user_id => 1,
      :object_type => "MyString",
      :object_id => 1
    ))
  end

  it "renders new like form" do
    render

    assert_select "form[action=?][method=?]", likes_path, "post" do

      assert_select "input#like_user_id[name=?]", "like[user_id]"

      assert_select "input#like_object_type[name=?]", "like[object_type]"

      assert_select "input#like_object_id[name=?]", "like[object_id]"
    end
  end
end
