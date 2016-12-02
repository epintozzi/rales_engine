class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

  def favorite_customer
    favorite = customers.joins(:transactions).merge(Transaction.successful).group(:id).order("count(transactions.id) DESC")

    customer_id = favorite.first

    Customer.find(customer_id)
  end

  def revenue
    invoices.joins(:transactions, :invoice_items).merge(Transaction.successful).sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def revenue_by_date(date)
    invoices.where(created_at: "#{date}")
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.top_merchants_by_revenue(number)
    joins(invoices: [:invoice_items, :transactions]).merge(Transaction.successful).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").limit(number)
  end

  def self.total_revenue_on_date(date)
    joins(invoices: [:invoice_items, :transactions]).where(invoices: {created_at: "#{date}"}).merge(Transaction.successful).sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.top_merchants_by_items_sold(number)
    joins(invoices: [:invoice_items, :transactions]).merge(Transaction.successful).group(:id).order("sum(invoice_items.quantity) DESC").limit(number)
  end

  def customers_with_pending_invoices
    customers.where(id: invoices.pending.pluck('DISTINCT customer_id')).uniq
    # ActiveRecord::Base.connection.execute("SELECT * FROM customers WHERE customers.id IN (SELECT customer_id  FROM invoices WHERE invoices.merchant_id = #{merchant_id.to_i} AND NOT EXISTS (SELECT * FROM transactions WHERE transactions.invoice_id = invoices.id AND transactions.result = 'success'))")
  end

end
