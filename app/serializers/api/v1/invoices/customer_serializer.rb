class Api::V1::Invoices::CustomerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
  
end
