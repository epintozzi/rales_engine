class Api::V1::Merchants::RevenuesController < ApplicationController

# respond_to :json

  def index
    merchant = Merchant.find(params[:merchant_id])
    merchant_revenue = {revenue: merchant.revenue}

    render json: merchant_revenue
  end
end
