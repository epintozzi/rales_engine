class Api::V1::Invoices::CustomersController < ApplicationController

  def index
    render json: Invoice.find(params[:invoice_id]).customer
  end
  
end
