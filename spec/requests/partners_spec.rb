require 'rails_helper'

RSpec.describe "Partners", type: :request do
  describe "GET /partners" do
    it "works! (now write some real specs)" do
      get partners_path
      expect(response).to have_http_status(200)
    end
  end
end
