require 'rails_helper'

describe "invoice/invoice_items relationship endpoints" do
  context "get /api/v1/invoices/:invoice_id/invoice_items" do
    it "returns a collection of invoice_items associated with that invoice" do
        invoice = create(:invoice)
        invoice_2 = create(:invoice)
        create_list(:invoice_item, 3, invoice_id:  invoice.id)
        create(:invoice_item, invoice_id: invoice_2.id)

        get "/api/v1/invoices/#{invoice.id}/invoice_items"


        invoice_items = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoice_items.count).to eq(3)
    end
  end
end
