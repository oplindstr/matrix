require 'rails_helper'

RSpec.describe "DocumentGroupCategories", type: :request do
  describe "GET /document_group_categories" do
    it "works! (now write some real specs)" do
      get document_group_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
