require 'rails_helper'

RSpec.describe "Portal::Users", type: :request do
  describe "GET /portal_users" do
    it "works! (now write some real specs)" do
      get portal_users_path
      expect(response).to have_http_status(200)
    end
  end
end
