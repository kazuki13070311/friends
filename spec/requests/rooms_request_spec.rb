require 'rails_helper'

RSpec.describe "Rooms", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/rooms/show"
      expect(response).to have_http_status(:success)
    end
  end

end
