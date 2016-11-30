class Api::V1::Merchants::RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    binding.pry
    # {"revenue" => "#{object}"}
    "#{object}"
  end
end
