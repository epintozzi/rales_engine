require 'rails_helper'

describe "invoice_items/invoice relationship endpoints" do
  context "get /api/v1/invoice_items/:invoice_item_id/invoice" do
    it "returns the invoice associated with that invoice_item" do
        invoice = create(:invoice, id: 2)
        invoice_2 = create(:invoice)
        invoice_item = create(:invoice_item, invoice_id: 2)

        get "/api/v1/invoice_items/#{invoice_item.id}/invoice"


        invoice = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoice["id"]).to eq(2)
    end
  end
end
