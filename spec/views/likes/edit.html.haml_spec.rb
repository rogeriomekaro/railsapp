require 'rails_helper'

RSpec.describe "likes/edit", :type => :view do
  before(:each) do
    @like = assign(:like, Like.create!(
      :user_id => 1,
      :object_type => "MyString",
      :object_id => 1
    ))
  end

  it "renders the edit like form" do
    render

    assert_select "form[action=?][method=?]", like_path(@like), "post" do

      assert_select "input#like_user_id[name=?]", "like[user_id]"

      assert_select "input#like_object_type[name=?]", "like[object_type]"

      assert_select "input#like_object_id[name=?]", "like[object_id]"
    end
  end
end
