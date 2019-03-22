require "rails_helper"

RSpec.describe PartnersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/partners").to route_to("partners#index")
    end

    it "routes to #new" do
      expect(:get => "/partners/new").to route_to("partners#new")
    end

    it "routes to #show" do
      expect(:get => "/partners/1").to route_to("partners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/partners/1/edit").to route_to("partners#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/partners").to route_to("partners#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/partners/1").to route_to("partners#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/partners/1").to route_to("partners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/partners/1").to route_to("partners#destroy", :id => "1")
    end
  end
end
