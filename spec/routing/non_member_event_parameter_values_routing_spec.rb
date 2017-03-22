require "rails_helper"

RSpec.describe NonMemberEventParameterValuesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/non_member_event_parameter_values").to route_to("non_member_event_parameter_values#index")
    end

    it "routes to #new" do
      expect(:get => "/non_member_event_parameter_values/new").to route_to("non_member_event_parameter_values#new")
    end

    it "routes to #show" do
      expect(:get => "/non_member_event_parameter_values/1").to route_to("non_member_event_parameter_values#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/non_member_event_parameter_values/1/edit").to route_to("non_member_event_parameter_values#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/non_member_event_parameter_values").to route_to("non_member_event_parameter_values#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/non_member_event_parameter_values/1").to route_to("non_member_event_parameter_values#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/non_member_event_parameter_values/1").to route_to("non_member_event_parameter_values#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/non_member_event_parameter_values/1").to route_to("non_member_event_parameter_values#destroy", :id => "1")
    end

  end
end
