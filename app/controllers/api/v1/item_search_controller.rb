class Api::V1::ItemSearchController < ApplicationController

  def index
    if params[:unit_price]
      render json: Item.where(unit_price: unit_price)
    else
      render json: Item.where(item_params)
    end
  end

  def show
    render json: Item.find_by(item_params)
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

  def unit_price
    (params[:unit_price].to_f*100).to_i.to_s
  end

end
