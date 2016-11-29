require 'rails_helper'

describe "items/invoice_items relationship endpoints" do
  context "get /api/v1/items/:item_id/invoice_items" do
    it "returns a collection of invoice_items associated with that item" do
        item = create(:item)
        item_2 = create(:item)
        create_list(:invoice_item, 3, item_id:  item.id)
        create(:invoice_item, item_id: item_2.id)

        get "/api/v1/items/#{item.id}/invoice_items"


        invoice_items = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoice_items.count).to eq(3)
    end
  end
end
