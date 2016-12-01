class Api::V1::MerchantSearchController < ApplicationController

  def index
    render json: Merchant.where(merchant_params)
  end

  def show
    render json: Merchant.find_by(merchant_params)
  end

  private

  def merchant_params
    params.permit(:id, :name)

  end

end
