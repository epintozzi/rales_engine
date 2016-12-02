class Api::V1::ItemRandomController < ApplicationController

  def show
    random = Item.all.count
    render json: Item.find(rand(random))
  end

end
