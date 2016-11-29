require 'rails_helper'

describe "transactions/invoices relationship endpoints" do
  context "get /api/v1/transactions/:transaction_id/invoice" do
    it "returns invoice associated with it" do
      invoice_og = create(:invoice)
      invoice_2 = create(:invoice)
      transaction = create(:transaction, invoice_id: invoice_og.id)

      get "/api/v1/transactions/#{transaction.id}/invoice"

      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice["id"]).to eq(invoice_og.id)
    end
  end
end
