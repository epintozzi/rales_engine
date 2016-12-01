require 'rails_helper'

describe "invoice/merchant relationship endpoints" do
  context "get /api/v1/invoices/:invoice_id/merchant" do
    it "returns the merchant associated with that invoice" do
        merchant = create(:merchant, id: 1)
        merchant_2 = create(:merchant)
        invoice = create(:invoice, merchant_id: 1)

        get "/api/v1/invoices/#{invoice.id}/merchant"


        merchant = JSON.parse(response.body)

        expect(response).to be_success
        expect(merchant["id"]).to eq(1)
    end
  end
end
