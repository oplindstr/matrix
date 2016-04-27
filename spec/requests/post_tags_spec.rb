require 'rails_helper'

RSpec.describe "PostTags", type: :request do
  describe "GET /post_tags" do
    it "works! (now write some real specs)" do
      get post_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
