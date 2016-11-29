require 'rails_helper'

describe "customers endpoints" do
  context "GET /customers" do
    it "returns a list of customers" do
      create_list(:customer, 3)

      get '/api/v1/customers'

      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq(3)
    end
  end
  context "GET /customers/:id" do
    it "can get one customer by its id" do
      id = create(:customer).id

      get "/api/v1/customers/#{id}"

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer["id"]).to eq(id)
    end
  end
end
