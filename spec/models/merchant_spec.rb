require 'rails_helper'

RSpec.describe Merchant, type: :model do

  context "returns a merchant's favorite customer" do
    it "picks customer with most successful transactions" do
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


      expect(merchant_1.favorite_customer).to eq(customer_2)
    end
  end

  context "returns total revenue for merchant across all transactions" do
    it "returns revenue from invoices with paid transactions" do
      merchant_1, merchant_2 = create_list(:merchant, 2)

      customer_2, customer_3, customer_4 = create_list(:customer, 3)

      invoice_2 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_2.id)

      invoice_3 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_3.id)

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

      expect(merchant_1.revenue).to eq(18)
    end
  end

  context "returns total revenue for merchant by date" do
    it "returns revenue from invoices on a specified date " do
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

      expect(merchant_1.revenue_by_date(date)).to eq(6)

    end
  end
end
