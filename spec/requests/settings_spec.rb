require 'rails_helper'

RSpec.describe "Settings", type: :request do
  describe "GET /settings" do
    it "works! (now write some real specs)" do
      FactoryGirl.create(:user)
      post session_path, :username => "joo", :password => "joo", :password_confirmation => "joo"
      get settings_path
      expect(response).to have_http_status(200)
    end
  end
end
