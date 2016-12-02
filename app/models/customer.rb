class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    favorite = merchants.joins(:transactions).merge(Transaction.successful).group(:id).order("count(transactions.id) DESC")

    merchant_id = favorite.first

    Merchant.find(merchant_id)
  end
  
end
