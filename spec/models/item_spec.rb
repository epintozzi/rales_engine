require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "relationships" do
    it "belongs to a merchant" do
        item = create(:item)
        expect(item).to respond_to(:merchant)
      end

    it "has many invoices through invoice_items" do
      item = create(:item)
      expect(item).to respond_to(:invoices)
      expect(item).to respond_to(:invoice_items)
    end

    it "has many invoice_items" do
        item = create(:item)
        expect(item).to respond_to(:invoice_items)
    end
  end

end
