class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices


  def top_merchants_by_revenue(quantity)
    joins(invoices: [:invoice_items, :transactions]).merge(Transaction.successful).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").limit(quantity)
  end

#total revenue across all merchants on date; in progress
  def total_revenue_on_date(date)
    merchants.joins(invoices: [:invoice_items, :transactions]).where(created_at: "2012-03-16 11:55:05").merge(Transaction.successful).sum("invoice_items.quantity * invoice_items.unit_price")

  end

  def favorite_customer
    favorite = customers.joins(:transactions).merge(Transaction.successful).group(:id).count.max_by do |k, v|
      v
    end

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

#use for all merchant's revenue on date
merchants.joins(invoices: [:invoice_items, :transactions]).merge(Transaction.successful)

#top x merchants by revenue
merchants.joins(invoices: [:invoice_items, :transactions]).merge(Transaction.successful).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC")

  # def revenue_by_date(date = nil)
  #   iv = invoices
  #
  #   iv = ivoices.where(created_at: "#{date}") unless date.nil?
  #
  #   iv.joins(:transactions, :invoice_items)
  #   .merge(Transaction.successful)
  #   .sum("invoice_items.quantity * invoice_items.unit_price")
  # end
end
