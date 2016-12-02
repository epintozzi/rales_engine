require 'rails_helper'

RSpec.describe Invoice, type: :model do

  describe "relationships" do
    it "belongs to a merchant" do
        invoice = create(:invoice)
        expect(invoice).to respond_to(:merchant)
      end

    it "belongs to a customer" do
        invoice = create(:invoice)
        expect(invoice).to respond_to(:customer)
      end

    it "has many items through invoice_items" do
      invoice = create(:invoice)
      expect(invoice).to respond_to(:items)
      expect(invoice).to respond_to(:invoice_items)
    end

    it "has many invoice_items" do
        invoice = create(:invoice)
        expect(invoice).to respond_to(:invoice_items)
      end

    it "has many transactions" do
        invoice = create(:invoice)
        expect(invoice).to respond_to(:transactions)
      end
  end
end
