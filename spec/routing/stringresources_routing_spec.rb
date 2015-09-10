require "rails_helper"

RSpec.describe StringresourcesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stringresources").to route_to("stringresources#index")
    end

    it "routes to #new" do
      expect(:get => "/stringresources/new").to route_to("stringresources#new")
    end

    it "routes to #show" do
      expect(:get => "/stringresources/1").to route_to("stringresources#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stringresources/1/edit").to route_to("stringresources#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stringresources").to route_to("stringresources#create")
    end

    it "routes to #update" do
      expect(:put => "/stringresources/1").to route_to("stringresources#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stringresources/1").to route_to("stringresources#destroy", :id => "1")
    end

  end
end
