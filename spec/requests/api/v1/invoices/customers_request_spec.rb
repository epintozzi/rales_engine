require 'rails_helper'

describe "invoice/customer relationship endpoints" do
  context "get /api/v1/invoices/:invoice_id/customer" do
    it "returns the customer associated with that invoice" do
        customer = create(:customer, id: 1)
        customer_2 = create(:customer)
        invoice = create(:invoice, customer_id: 1)

        get "/api/v1/invoices/#{invoice.id}/customer"


        customer = JSON.parse(response.body)

        expect(response).to be_success
        expect(customer["id"]).to eq(1)
    end
  end
end
