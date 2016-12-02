require 'rails_helper'

RSpec.describe Api::V1::Customers::FavoriteMerchantsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      customer = create(:customer)
      get "/api/v1/customers/#{customer.id}/favorite_merchant"
      expect(response).to have_http_status(:success)
    end
  end

end
