require 'rails_helper'

RSpec.describe Transaction, type: :model do

  describe "relationships" do
    it "belongs to a invoice" do
        transaction = create(:transaction)
        expect(transaction).to respond_to(:invoice)
    end
  end
end
