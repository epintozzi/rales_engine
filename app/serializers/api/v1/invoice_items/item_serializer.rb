class Api::V1::InvoiceItems::ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :merchant_id, :name, :unit_price


end
