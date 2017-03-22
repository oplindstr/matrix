require 'rails_helper'

RSpec.describe "EventParameterValues", type: :request do
  describe "GET /event_parameter_values" do
    it "works! (now write some real specs)" do
      get event_parameter_values_path
      expect(response).to have_http_status(200)
    end
  end
end
