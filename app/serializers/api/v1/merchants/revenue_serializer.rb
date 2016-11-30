class Api::V1::Merchants::RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    (object/100.00).to_s
  end
end
