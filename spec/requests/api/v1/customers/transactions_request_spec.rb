require 'rails_helper'

describe "customers/transactions relationship endpoints" do
  context "get /api/v1/customers/:item_id/transactions" do
    it "returns a collection of transactions associated with that customer" do
        og_customer = create(:customer)
        customer_2 = create(:customer)
        invoice_1, invoice_2 = create_list(:invoice, 2, customer_id:  og_customer.id)
        invoice_3 = create(:invoice, customer_id:customer_2.id)
        transaction_1 = create(:transaction, invoice_id: invoice_1.id)
        transaction_2 = create(:transaction, invoice_id: invoice_2.id)
        transaction_3 = create(:transaction, invoice_id: invoice_2.id)
        transaction_4 = create(:transaction, invoice_id: invoice_3.id)

        get "/api/v1/customers/#{og_customer.id}/transactions"


        transactions = JSON.parse(response.body)

        expect(response).to be_success
        expect(transactions.count).to eq(3)
    end
  end
end
