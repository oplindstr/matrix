require "rails_helper"

RSpec.describe PostCommentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/post_comments").to route_to("post_comments#index")
    end

    it "routes to #new" do
      expect(:get => "/post_comments/new").to route_to("post_comments#new")
    end

    it "routes to #show" do
      expect(:get => "/post_comments/1").to route_to("post_comments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/post_comments/1/edit").to route_to("post_comments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/post_comments").to route_to("post_comments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/post_comments/1").to route_to("post_comments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/post_comments/1").to route_to("post_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/post_comments/1").to route_to("post_comments#destroy", :id => "1")
    end

  end
end
