require 'rails_helper'

describe "item/merchant relationship endpoints" do
  context "get /api/v1/items/:item_id/item" do
    it "returns  merchant associated with that item" do
        og_merchant = create(:merchant)
        merchant_2 = create(:merchant)
        item = create(:item, merchant_id: og_merchant.id)

        get "/api/v1/items/#{item.id}/merchant"

        merchant = JSON.parse(response.body)

        expect(response).to be_success
        expect(merchant["id"]).to eq(og_merchant.id)
    end
  end
end
