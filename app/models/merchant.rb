class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

  def favorite_customer
    Merchant.find(80).customers.joins(:transactions)
    .merge(Transaction.successful)
    .group(:id)
    .order("count(transactions.*) desc")
  end

  def revenue
    invoices.joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def revenue_by_date(date)
    invoices.where(created_at: "#{date}")
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def top_merchants_by_revenue(number)
    Merchant.all.joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful).group(:id)
    .order("sum(invoice_items.unit_price * invoice_items.quantity) desc")
    .limit(number)
  end

  def all_merchant_revenue_by_date(date)
    Merchant.all.joins(invoices: [:invoice_items, :transactions])
    .where(invoices: {created_at: "#{date}"})
    .merge(Transaction.successful)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def top_merchants_by_items_sold(number)
    Merchant.all.joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful).group(:id)
    .order("sum(invoice_items.quantity) desc")
    .limit(number)
  end

end
