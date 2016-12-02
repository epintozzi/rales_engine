class Api::V1::MerchantsItemsController < ApplicationController

  def show
    render json: Merchant.top_merchants_by_items_sold(params[:quantity])
  end

end
