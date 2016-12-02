class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def best_day
    best = invoices.joins(:transactions, :invoice_items).merge(Transaction.successful).group(:created_at).order("sum(invoice_items.quantity) desc").pluck(:created_at).first
  end

  def self.top_items_by_quantity_sold(number)
    joins(invoices: [:transactions, :invoice_items]).merge(Transaction.successful).group(:id).order("count(invoice_items.id) DESC").limit(number)
  end

  def top_items_by_revenue(number)
    joins(invoices: [:transactions, :invoice_items]).merge(Transaction.successful).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").limit(number)
  end

end
