class Api::V1::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  def unit_price
    (object.unit_price/100.to_f).to_s
  end
  
end
