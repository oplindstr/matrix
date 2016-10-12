require "rails_helper"

RSpec.describe DocumentGroupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/document_groups").to route_to("document_groups#index")
    end

    it "routes to #new" do
      expect(:get => "/document_groups/new").to route_to("document_groups#new")
    end

    it "routes to #show" do
      expect(:get => "/document_groups/1").to route_to("document_groups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/document_groups/1/edit").to route_to("document_groups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/document_groups").to route_to("document_groups#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/document_groups/1").to route_to("document_groups#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/document_groups/1").to route_to("document_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/document_groups/1").to route_to("document_groups#destroy", :id => "1")
    end

  end
end
