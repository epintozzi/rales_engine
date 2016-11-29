require 'rails_helper'

describe "merchant/invoices relationship endpoints" do
  context "get /api/v1/merchants/:merchant_id/invoices" do
    it "returns a collection of invoices associated with that merchant" do
        merchant = create(:merchant)
        merchant_2 = create(:merchant)
        create_list(:invoice, 3, merchant_id:  merchant.id)
        create(:invoice, merchant_id: merchant_2.id)

        get "/api/v1/merchants/#{merchant.id}/invoices"


        invoices = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoices.count).to eq(3)
    end
  end
end
