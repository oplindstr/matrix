require "rails_helper"

RSpec.describe HpStatisticsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hp_statistics").to route_to("hp_statistics#index")
    end

    it "routes to #new" do
      expect(:get => "/hp_statistics/new").to route_to("hp_statistics#new")
    end

    it "routes to #show" do
      expect(:get => "/hp_statistics/1").to route_to("hp_statistics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hp_statistics/1/edit").to route_to("hp_statistics#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hp_statistics").to route_to("hp_statistics#create")
    end

    it "routes to #update" do
      expect(:put => "/hp_statistics/1").to route_to("hp_statistics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hp_statistics/1").to route_to("hp_statistics#destroy", :id => "1")
    end

  end
end
