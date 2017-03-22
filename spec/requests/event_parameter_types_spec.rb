require 'rails_helper'

RSpec.describe "EventParameterTypes", type: :request do
  describe "GET /event_parameter_types" do
    it "works! (now write some real specs)" do
      get event_parameter_types_path
      expect(response).to have_http_status(200)
    end
  end
end
