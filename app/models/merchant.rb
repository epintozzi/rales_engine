class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def favorite_customer
    favorite = customers.joins(:transactions).where(transactions: {result: "success"}).select(:customers).group(:id).count.max_by do |k, v|
      v
    end

    customer_id = favorite.first

    Customer.find(customer_id)
  end

end
