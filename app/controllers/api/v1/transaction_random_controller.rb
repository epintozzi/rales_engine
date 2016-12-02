class Api::V1::TransactionRandomController < ApplicationController

  def show
    random = Transaction.all.count
    render json: Transaction.find(rand(random))
  end

end
