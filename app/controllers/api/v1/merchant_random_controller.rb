class Api::V1::MerchantRandomController < ApplicationController

  def show
    random = Merchant.all.count
    render json: Merchant.find(rand(random))
  end

end
