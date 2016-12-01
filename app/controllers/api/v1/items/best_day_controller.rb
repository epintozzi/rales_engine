class Api::V1::Items::BestDayController < ApplicationController

  def index
    item = Item.find(params[:item_id])

    render json: item.best_day
  end
end
