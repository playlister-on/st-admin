require 'rails_helper'

RSpec.describe "Portal::Configs", type: :request do
  describe "GET /portal_configs" do
    it "works! (now write some real specs)" do
      get portal_configs_path
      expect(response).to have_http_status(200)
    end
  end
end
