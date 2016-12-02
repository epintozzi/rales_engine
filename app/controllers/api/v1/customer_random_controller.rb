class Api::V1::CustomerRandomController < ApplicationController

  def show
    random = Customer.all.count
    render json: Customer.find(rand(random))
  end

end
