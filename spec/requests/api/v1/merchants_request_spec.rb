require 'rails_helper'

describe "merchants endpoints" do
  context "GET /merchants" do
    it "returns a list of merchants" do
      create_list(:merchant, 3)

      get '/api/v1/merchants'

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants.count).to eq(3)
    end
  end
  context "GET /merchants/:id" do
    it "can get one merchant by its id" do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["id"]).to eq(id)
    end
  end

end
