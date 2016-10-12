require "rails_helper"

RSpec.describe SignupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/signups").to route_to("signups#index")
    end

    it "routes to #new" do
      expect(:get => "/signups/new").to route_to("signups#new")
    end

    it "routes to #show" do
      expect(:get => "/signups/1").to route_to("signups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/signups/1/edit").to route_to("signups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/signups").to route_to("signups#create")
    end

    it "routes to #update" do
      expect(:put => "/signups/1").to route_to("signups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/signups/1").to route_to("signups#destroy", :id => "1")
    end

  end
end
