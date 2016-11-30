require 'rails_helper'

describe "merchant/favorite_customer result" do
  context "get /api/v1/merchants/:merchant_id/favorite_customer" do
    it "returns the customer with most transactions with 'result' of 'success' associated with that merchant" do
      merchant_1, merchant_2 = create_list(:merchant, 2)

      customer_1, customer_2, customer_3, customer_4 = create_list(:customer, 4)

      invoice_1 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_1.id)
      invoice_2 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_2.id)
      invoice_3 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_3.id)

      invoice_4 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer_4.id)

      transaction_1 = create(:transaction, invoice_id: invoice_1.id, result: "success")
      transaction_2 = create(:transaction, invoice_id: invoice_2.id, result: "success")
      transaction_3 = create(:transaction, invoice_id: invoice_2.id, result: "success")
      transaction_4 = create(:transaction, invoice_id: invoice_3.id, result: "failed")
      transaction_5 = create(:transaction, invoice_id: invoice_3.id, result: "success")
      create_list(:transaction, 3, result: "success", invoice_id: invoice_4.id)

        get "/api/v1/merchants/#{merchant_1.id}/favorite_customer"

        customer = JSON.parse(response.body)

        expect(response).to be_success
        expect(customer["id"]).to eq(customer_2.id)
    end
  end
end
