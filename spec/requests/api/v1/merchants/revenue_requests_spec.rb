require 'rails_helper'

describe "merchant/:merchant_id?revenue" do
  context "get api/v1/merchants/:merchant_id/revenue" do
    it "returns the revenue for paid transactions merchant by id" do

      date = "2012-03-16 11:55:05"

      merchant_1, merchant_2 = create_list(:merchant, 2)
      customer_2, customer_3, customer_4 = create_list(:customer, 3)

      invoice_2 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_2.id)

      invoice_3 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_3.id, created_at: date)

      invoice_4 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer_4.id)

      transaction_2 = create(:transaction, invoice_id: invoice_2.id, result: "success")
      transaction_3 = create(:transaction, invoice_id: invoice_2.id, result: "success")
      transaction_4 = create(:transaction, invoice_id: invoice_3.id, result: "failed")
      transaction_5 = create(:transaction, invoice_id: invoice_3.id, result: "success")
      create_list(:transaction, 3, result: "success", invoice_id: invoice_4.id)

      invoice_item_1 = create(:invoice_item, unit_price: 2, quantity: 1, invoice_id: invoice_2.id)
      invoice_item_2 = create(:invoice_item, unit_price: 2, quantity: 2, invoice_id: invoice_2.id)
      invoice_item_3 = create(:invoice_item, unit_price: 2, quantity: 3, invoice_id: invoice_3.id)
      invoice_item_4 = create(:invoice_item, unit_price: 2, quantity: 2, invoice_id: invoice_4.id)

      get "/api/v1/merchants/#{merchant_1.id}/revenue"

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue["revenue"]).to eq("0.18")
    end
  end
  context "get api/v1/merchants/:merchant_id/revenue?date=x" do
    it "returns the revenue for paid transactions merchant by id for a date" do
      date = "2012-03-16 11:55:05"

      merchant_1, merchant_2 = create_list(:merchant, 2)
      customer_2, customer_3, customer_4 = create_list(:customer, 3)

      invoice_2 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_2.id)

      invoice_3 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_3.id, created_at: date)

      invoice_4 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer_4.id)

      transaction_2 = create(:transaction, invoice_id: invoice_2.id, result: "success")
      transaction_3 = create(:transaction, invoice_id: invoice_2.id, result: "success")
      transaction_4 = create(:transaction, invoice_id: invoice_3.id, result: "failed")
      transaction_5 = create(:transaction, invoice_id: invoice_3.id, result: "success")
      create_list(:transaction, 3, result: "success", invoice_id: invoice_4.id)

      invoice_item_1 = create(:invoice_item, unit_price: 2, quantity: 1, invoice_id: invoice_2.id)
      invoice_item_2 = create(:invoice_item, unit_price: 2, quantity: 2, invoice_id: invoice_2.id)
      invoice_item_3 = create(:invoice_item, unit_price: 2, quantity: 3, invoice_id: invoice_3.id)
      invoice_item_4 = create(:invoice_item, unit_price: 2, quantity: 2, invoice_id: invoice_4.id)

      get "/api/v1/merchants/#{merchant_1.id}/revenue?date=#{date}"

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue["revenue"]).to eq("0.06")
    end
  end
end
