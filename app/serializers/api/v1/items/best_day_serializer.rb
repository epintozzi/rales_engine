class Api::V1::Items::BestDaySerializer < ActiveModel::Serializer
  attributes :date

  def date
    object
  end
end
