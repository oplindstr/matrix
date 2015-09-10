require 'rails_helper'

RSpec.describe "Stringresources", type: :request do
  describe "GET /stringresources" do
    it "works! (now write some real specs)" do
      get stringresources_path
      expect(response).to have_http_status(200)
    end
  end
end
