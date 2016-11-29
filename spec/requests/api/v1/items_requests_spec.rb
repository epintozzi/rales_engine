require 'rails_helper'

describe "items endpoints" do
  context "GET /items" do
    it "returns a list of items" do
      create_list(:item, 3)

      get '/api/v1/items'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(3)
    end
  end

  context "GET /items/:id" do
    it "can get one item by its id" do
      id = create(:item).id

      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["id"]).to eq(id)
    end
  end
end
