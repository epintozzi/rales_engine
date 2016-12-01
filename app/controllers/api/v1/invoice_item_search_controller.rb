class Api::V1::InvoiceItemSearchController < ApplicationController

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  private

  def invoice_item_params
    params.permit(:id, :quantity, :item_id, :invoice_id, :unit_price, :created_at, :updated_at)
  end

end
