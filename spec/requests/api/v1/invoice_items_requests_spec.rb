require 'rails_helper'

describe "invoice_items endpoints" do
  context "GET /invoice_items" do
    it "returns a list of invoice_items" do
      create_list(:invoice_item, 3)

      get '/api/v1/invoice_items'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(3)
    end
  end
  context "GET /invoice_items/:id" do
    it "can get one invoice_item by its id" do
      id = create(:invoice_item).id

      get "/api/v1/invoice_items/#{id}"

      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item["id"]).to eq(id)
    end
  end
end
