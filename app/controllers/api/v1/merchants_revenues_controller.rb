class Api::V1::MerchantsRevenuesController < ApplicationController

  def index
    
    render json: Merchant.total_revenue_on_date(params[:date]), serializer: Api::V1::MerchantRevenueByDateSerializer
  end
end
