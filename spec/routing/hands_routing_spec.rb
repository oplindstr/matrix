require "rails_helper"

RSpec.describe HandsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hands").to route_to("hands#index")
    end

    it "routes to #new" do
      expect(:get => "/hands/new").to route_to("hands#new")
    end

    it "routes to #show" do
      expect(:get => "/hands/1").to route_to("hands#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hands/1/edit").to route_to("hands#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hands").to route_to("hands#create")
    end

    it "routes to #update" do
      expect(:put => "/hands/1").to route_to("hands#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hands/1").to route_to("hands#destroy", :id => "1")
    end

  end
end
