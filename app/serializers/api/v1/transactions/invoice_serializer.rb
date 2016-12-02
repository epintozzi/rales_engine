class Api::V1::Transactions::InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :merchant_id, :status

end
