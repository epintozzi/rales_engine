require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do

  describe "relationships" do
    it "belongs to an item" do
        invoice_item = create(:invoice_item)
        expect(invoice_item).to respond_to(:item)
      end

  it "belongs to an invoice" do
      invoice_item = create(:invoice_item)
      expect(invoice_item).to respond_to(:invoice)
    end
  end
end
