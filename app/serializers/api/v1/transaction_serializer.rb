class Api::V1::TransactionSerializer < ActiveModel::Serializer
  attributes :id, :credit_card_number, :invoice_id, :result
  
end
