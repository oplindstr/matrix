require 'rails_helper'

RSpec.describe "EventParameters", type: :request do
  describe "GET /event_parameters" do
    it "works! (now write some real specs)" do
      get event_parameters_path
      expect(response).to have_http_status(200)
    end
  end
end
