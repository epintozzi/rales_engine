class Api::V1::ItemsMostItemsController < ApplicationController

  def show
    render json: Item.top_items_by_quantity_sold(params[:quantity])
  end

end
