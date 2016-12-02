class Api::V1::MerchantsItemsController < ApplicationController

  def show
    # binding.pry
    render json: Merchant.top_merchants_by_items_sold(params[:quantity])
  end


  # private
  #
  # def
  #
  # end
end
