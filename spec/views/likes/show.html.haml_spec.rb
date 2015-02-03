require 'rails_helper'

RSpec.describe "likes/show", :type => :view do
  before(:each) do
    @like = assign(:like, Like.create!(
      :user_id => 1,
      :object_type => "Object Type",
      :object_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Object Type/)
    expect(rendered).to match(/2/)
  end
end
