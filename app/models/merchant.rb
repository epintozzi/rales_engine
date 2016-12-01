class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

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
