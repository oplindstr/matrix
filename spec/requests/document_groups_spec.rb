require 'rails_helper'

RSpec.describe "DocumentGroups", type: :request do
  describe "GET /document_groups" do
    it "works! (now write some real specs)" do
      get document_groups_path
      expect(response).to have_http_status(200)
    end
  end
end
