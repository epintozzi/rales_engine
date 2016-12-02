class Api::V1::Customers::FavoriteMerchantsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    render json: customer.favorite_merchant
  end
  
end
