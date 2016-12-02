class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :successful, -> { includes(:transactions).where(transactions: {result: "success"}) }
  scope :pending, -> { where.not(id: Transaction.where(result: "success").pluck('DISTINCT invoice_id') ) }

end
