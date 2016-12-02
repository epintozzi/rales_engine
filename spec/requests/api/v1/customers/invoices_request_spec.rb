require 'rails_helper'

describe "customers/invoices relationship endpoints" do
  context "get /api/v1/customers/:item_id/invoices" do
    it "returns a collection of invoice_items associated with that item" do
        customer = create(:customer)
        customer_2 = create(:customer)
        create_list(:invoice, 3, customer_id:  customer.id)
        create(:invoice, customer_id: customer_2.id)

        get "/api/v1/customers/#{customer.id}/invoices"


        invoices = JSON.parse(response.body)

        expect(response).to be_success
        expect(invoices.count).to eq(3)
    end
  end
end
