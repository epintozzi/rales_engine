class Api::V1::Merchants::FavoriteCustomersController < ApplicationController

  def index
    merchant = Merchant.find(params[:merchant_id])
    render json: merchant.favorite_customer
  end
  
end
