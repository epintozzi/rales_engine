class Api::V1::InvoiceItemRandomController < ApplicationController

  def show
    random = InvoiceItem.all.count
    render json: InvoiceItem.find(rand(random))
  end

end
