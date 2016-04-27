require "rails_helper"

RSpec.describe PostTagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/post_tags").to route_to("post_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/post_tags/new").to route_to("post_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/post_tags/1").to route_to("post_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/post_tags/1/edit").to route_to("post_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/post_tags").to route_to("post_tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/post_tags/1").to route_to("post_tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/post_tags/1").to route_to("post_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/post_tags/1").to route_to("post_tags#destroy", :id => "1")
    end

  end
end
