class Api::V1::Merchants::RevenuesController < ApplicationController

  def index
    merchant = Merchant.find(params[:merchant_id])
    if date_exists?
      render json: merchant.revenue_by_date(date), serializer: Api::V1::Merchants::RevenueSerializer
    else
      render json: merchant.revenue, serializer: Api::V1::Merchants::RevenueSerializer
    end
  end
  private
  def date_exists?
    !params[:date].nil?
  end

  def date
    params[:date]
  end
  
end
