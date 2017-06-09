require "rails_helper"

RSpec.describe EventParameterChoicesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_parameter_choices").to route_to("event_parameter_choices#index")
    end

    it "routes to #new" do
      expect(:get => "/event_parameter_choices/new").to route_to("event_parameter_choices#new")
    end

    it "routes to #show" do
      expect(:get => "/event_parameter_choices/1").to route_to("event_parameter_choices#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_parameter_choices/1/edit").to route_to("event_parameter_choices#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_parameter_choices").to route_to("event_parameter_choices#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_parameter_choices/1").to route_to("event_parameter_choices#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_parameter_choices/1").to route_to("event_parameter_choices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_parameter_choices/1").to route_to("event_parameter_choices#destroy", :id => "1")
    end

  end
end
