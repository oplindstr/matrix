require "rails_helper"

RSpec.describe EventParametersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_parameters").to route_to("event_parameters#index")
    end

    it "routes to #new" do
      expect(:get => "/event_parameters/new").to route_to("event_parameters#new")
    end

    it "routes to #show" do
      expect(:get => "/event_parameters/1").to route_to("event_parameters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_parameters/1/edit").to route_to("event_parameters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_parameters").to route_to("event_parameters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_parameters/1").to route_to("event_parameters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_parameters/1").to route_to("event_parameters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_parameters/1").to route_to("event_parameters#destroy", :id => "1")
    end

  end
end
