class Api::V1::InvoiceItems::ItemsController < ApplicationController

  def index
    render json: InvoiceItem.find(params[:invoice_item_id]).item
  end
  
end
