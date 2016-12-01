require 'rails_helper'

describe "invoice/items relationship endpoints" do
  context "get /api/v1/invoices/:invoice_id/items" do
    it "returns a collection of items associated with that invoice" do
        item_1, item_2 = create_list(:item, 2)

        invoice_1, invoice_2 = create_list(:invoice, 2)

        create(:invoice_item, invoice_id: invoice_1.id, item_id: item_1.id)
        create(:invoice_item, invoice_id: invoice_2.id, item_id: item_2.id)

        get "/api/v1/invoices/#{invoice_1.id}/items"

        items = JSON.parse(response.body)

        expect(response).to be_success
        expect(items.count).to eq(1)
    end
  end
end
