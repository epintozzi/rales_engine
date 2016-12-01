class Api::V1::Customers::InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :merchant_id, :status
end
