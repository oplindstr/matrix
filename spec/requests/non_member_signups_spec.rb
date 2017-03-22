require 'rails_helper'

RSpec.describe "NonMemberSignups", type: :request do
  describe "GET /non_member_signups" do
    it "works! (now write some real specs)" do
      get non_member_signups_path
      expect(response).to have_http_status(200)
    end
  end
end
