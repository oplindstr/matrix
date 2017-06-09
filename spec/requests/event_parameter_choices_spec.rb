require 'rails_helper'

RSpec.describe "EventParameterChoices", type: :request do
  describe "GET /event_parameter_choices" do
    it "works! (now write some real specs)" do
      get event_parameter_choices_path
      expect(response).to have_http_status(200)
    end
  end
end
