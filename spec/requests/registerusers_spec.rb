require 'rails_helper'

RSpec.describe "Registerusers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/registerusers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/registerusers/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/registerusers/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/registerusers/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
