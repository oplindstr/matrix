require 'rails_helper'

RSpec.describe "Hands", type: :request do
  describe "GET /hands" do
    it "works! (now write some real specs)" do
      get hands_path
      expect(response).to have_http_status(200)
    end
  end
end
