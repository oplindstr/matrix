require 'rails_helper'

RSpec.describe "NonMemberEventParameterValues", type: :request do
  describe "GET /non_member_event_parameter_values" do
    it "works! (now write some real specs)" do
      get non_member_event_parameter_values_path
      expect(response).to have_http_status(200)
    end
  end
end
