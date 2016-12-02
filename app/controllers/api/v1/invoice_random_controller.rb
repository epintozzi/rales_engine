class Api::V1::InvoiceRandomController < ApplicationController

  def show
    random = Invoice.all.count
    render json: Invoice.find(rand(random))
  end

end
