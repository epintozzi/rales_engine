class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def best_day
    best = invoices.joins(:transactions, :invoice_items).merge(Transaction.successful).group(:created_at).order("sum(invoice_items.quantity) desc").pluck(:created_at).first
  end
end
