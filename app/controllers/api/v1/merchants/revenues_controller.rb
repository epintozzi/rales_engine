class Api::V1::Merchants::RevenuesController < ApplicationController

  def index
    merchant = Merchant.find(params[:merchant_id])
    merchant_revenue = {revenue: merchant.revenue}

    render json: merchant.revenue, serializer: RevenueSerializer
  end
end
