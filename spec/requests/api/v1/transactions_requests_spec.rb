require 'rails_helper'

describe "transactions endpoints" do
  context "GET /transactions" do
    it "returns a list of transactions" do
      create_list(:transaction, 3)

      get '/api/v1/transactions'

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq(3)
    end
  end
  context "GET /transactions/:id" do
    it "can get one transaction by its id" do
      # transactions = create_list(:transaction, 3)
      # id = transactions.first.id
      id = create(:transaction).id

      get "/api/v1/transactions/#{id}"

      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction["id"]).to eq(id)
    end
  end
end
