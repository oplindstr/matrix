require 'rails_helper'

RSpec.describe "HpStatistics", type: :request do
  describe "GET /hp_statistics" do
    it "works! (now write some real specs)" do
      get hp_statistics_path
      expect(response).to have_http_status(200)
    end
  end
end
