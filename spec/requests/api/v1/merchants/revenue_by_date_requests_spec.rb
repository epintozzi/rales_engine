require 'rails_helper'

describe "merchants/:merchant_id/revenue?date=x" do
  context "get /api/v1/merchants/:merchant_id/revenue?date=x" do
    it "returns the revenue for all merchants on a certain dates" do
      date_1 = "2012-03-16 11:55:05"
      date_2 = "2012-03-16 11:55:06"

      merchant_1, merchant_2, merchant_3 = create_list(:merchant,3)

      customer_1, customer_2 = create_list(:customer, 2)

      invoice_1 = create(:invoice, merchant:merchant_1, customer: customer_1, created_at: date_1)
      invoice_2 = create(:invoice, merchant:merchant_1, customer: customer_2, created_at: date_1)
      invoice_3 = create(:invoice, merchant:merchant_3, customer: customer_2, created_at: date_1)
      invoice_4 = create(:invoice, merchant:merchant_3, customer: customer_2, created_at: date_2)

      transaction_1 = create(:transaction, invoice: invoice_1 , result:"success")
      transaction_2 = create(:transaction, invoice: invoice_2 , result:"success")
      transaction_3 = create(:transaction, invoice: invoice_3 , result:"failed")
      transaction_3 = create(:transaction, invoice: invoice_4 , result:"success")

      item_1 = create(:item)

      invoice_item_ = create(:invoice_item, invoice: invoice_1, item: item_1)
      invoice_item_ = create(:invoice_item, invoice: invoice_2, item: item_1)
      invoice_item_ = create(:invoice_item, invoice: invoice_3, item: item_1)
      invoice_item_ = create(:invoice_item, invoice: invoice_4, item: item_1)

      get "/api/v1/merchants/#{merchant_1.id}/revenue?date=#{date_1}"

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue["revenue"]).to eq("0.02")
    end
  end
end
