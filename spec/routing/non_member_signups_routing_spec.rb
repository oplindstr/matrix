require "rails_helper"

RSpec.describe NonMemberSignupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/non_member_signups").to route_to("non_member_signups#index")
    end

    it "routes to #new" do
      expect(:get => "/non_member_signups/new").to route_to("non_member_signups#new")
    end

    it "routes to #show" do
      expect(:get => "/non_member_signups/1").to route_to("non_member_signups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/non_member_signups/1/edit").to route_to("non_member_signups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/non_member_signups").to route_to("non_member_signups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/non_member_signups/1").to route_to("non_member_signups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/non_member_signups/1").to route_to("non_member_signups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/non_member_signups/1").to route_to("non_member_signups#destroy", :id => "1")
    end

  end
end
