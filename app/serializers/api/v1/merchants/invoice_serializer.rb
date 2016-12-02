class Api::V1::Merchants::InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :merchant_id, :status

end
