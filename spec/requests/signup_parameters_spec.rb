require 'rails_helper'

RSpec.describe "SignupParameters", type: :request do
  describe "GET /signup_parameters" do
    it "works! (now write some real specs)" do
      get signup_parameters_path
      expect(response).to have_http_status(200)
    end
  end
end
