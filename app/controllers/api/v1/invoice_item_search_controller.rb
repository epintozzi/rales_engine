class Api::V1::InvoiceItemSearchController < ApplicationController

  def index
    if params[:unit_price]
      render json: InvoiceItem.where(unit_price: unit_price)
    else
      render json: InvoiceItem.where(invoice_item_params)
    end
  end

  def show
    if params[:unit_price]
      render json: InvoiceItem.find_by(unit_price: unit_price)
    else
      render json: InvoiceItem.find_by(invoice_item_params)
    end
  end

  private

  def invoice_item_params
    params.permit(:id, :quantity, :item_id, :invoice_id, :unit_price, :created_at, :updated_at)
  end

  def unit_price
    (params[:unit_price].to_d * 100).to_i
  end

end
