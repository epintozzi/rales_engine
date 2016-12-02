require 'rails_helper'

describe "invoice/transactions relationship endpoints" do
  context "get /api/v1/invoices/:invoice_id/transactions" do
    it "returns a collection of transactions associated with that invoice" do
        invoice = create(:invoice)
        invoice_2 = create(:invoice)
        create_list(:transaction, 3, invoice_id:  invoice.id)
        create(:transaction, invoice_id: invoice_2.id)

        get "/api/v1/invoices/#{invoice.id}/transactions"


        transactions = JSON.parse(response.body)

        expect(response).to be_success
        expect(transactions.count).to eq(3)
    end
  end
end
