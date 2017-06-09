require "rails_helper"

RSpec.describe SignupParametersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/signup_parameters").to route_to("signup_parameters#index")
    end

    it "routes to #new" do
      expect(:get => "/signup_parameters/new").to route_to("signup_parameters#new")
    end

    it "routes to #show" do
      expect(:get => "/signup_parameters/1").to route_to("signup_parameters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/signup_parameters/1/edit").to route_to("signup_parameters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/signup_parameters").to route_to("signup_parameters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/signup_parameters/1").to route_to("signup_parameters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/signup_parameters/1").to route_to("signup_parameters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/signup_parameters/1").to route_to("signup_parameters#destroy", :id => "1")
    end

  end
end
