class Api::V1::Merchants::ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :merchant_id, :name, :unit_price, :silly

  def silly
    "frenchfries"
  end
end
