require 'rails_helper'

describe "merchant/items relationship endpoints" do
  context "get /api/v1/merchants/:merchant_id/items" do
    it "returns a collection of items associated with that merchant" do
        merchant = create(:merchant)
        merchant_2 = create(:merchant)
        create_list(:item, 3, merchant_id:  merchant.id)
        create(:item, merchant_id: merchant_2.id)

        get "/api/v1/merchants/#{merchant.id}/items"


        items = JSON.parse(response.body)

        expect(response).to be_success
        expect(items.count).to eq(3)
    end
  end
end
