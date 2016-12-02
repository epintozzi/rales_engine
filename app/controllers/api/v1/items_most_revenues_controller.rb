class Api::V1::ItemsMostRevenuesController < ApplicationController

  def show
    render json: Item.top_items_by_revenue(params[:quantity])
  end

end
