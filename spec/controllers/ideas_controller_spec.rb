require 'rails_helper'

RSpec.describe IdeasController, :type => :controller do

  describe "GET index" do
    it "renders the index html view" do
      get :index, format: :html, status: 200
      expect(response).to render_template("index")
      expect(response.request.format).to eq(:html)
    end

    it "renders the index js view" do
      xhr :get, :index, format: :js, status: 200
      expect(response.request.format).to eq(:js)
      expect(response).to render_template("index")
    end

    before :each do
       @ideas = create_list(:idea, 3)
    end

    it "should contains a Idea's collection" do
      get :index, format: :html, status: 200
      expect(assigns(:ideas)).to match_array(@ideas)
    end

    it "should contains an empty Idea's collection case there isn't ideas " do
      @ideas.destroy_all
      get :index, format: :html, status: 200
      expect(assigns(:ideas).to_a).to be_empty
    end

    it "should contains an empty Idea's collection case not found ideas by searching" do
      xhr :get, :index, {description: 'ola'}
      expect(assigns(:ideas).to_a).to be_empty
    end

    it "should have a valid description parameter" do
       xhr :get, :index, {description: "ola"}
       expect(controller.params[:description]).to eq("ola")
       expect(response.request.format).to eq(:js)
    end

    it "should contains a valid Ideas's collection case description param is present" do
      @ideas_will_find = create_list(:idea, 3, description: "ola")
      xhr :get, :index, {description: "ola"}
      expect(assigns(:ideas)).to match_array(@ideas_will_find)

      @ideas_will_find.destroy_all
    end

  end

end
  