require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "relationships" do
    it "has many transactions through invoices" do
      customer = create(:customer)
      expect(customer).to respond_to(:transactions)
      expect(customer).to respond_to(:invoices)
    end

    it "has many merchants through invoices" do
      customer = create(:customer)
      expect(customer).to respond_to(:merchants)
      expect(customer).to respond_to(:invoices)
    end
  end

  it "has many invoices" do
      customer = create(:customer)
      expect(customer).to respond_to(:invoices)
    end

end
