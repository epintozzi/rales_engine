require 'rails_helper'

describe "invoice_items/item relationship endpoints" do
  context "get /api/v1/invoice_items/:invoice_item_id/item" do
    it "returns the item associated with that invoice_item" do
        item = create(:item, id: 2)
        item_2 = create(:item)
        invoice_item = create(:invoice_item, item_id: 2)

        get "/api/v1/invoice_items/#{invoice_item.id}/item"


        item = JSON.parse(response.body)

        expect(response).to be_success
        expect(item["id"]).to eq(2)
    end
  end
end
