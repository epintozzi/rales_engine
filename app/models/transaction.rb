class Transaction < ApplicationRecord
  belongs_to :invoice

  scope :successful, -> { where(result: "success")}
  #
  # def self.successful
  #   where(result: "success")
  # end
end
