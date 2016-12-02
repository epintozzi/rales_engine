require 'csv'

class MerchantParser
  attr_reader :path

  def initialize
    @path = "./data/merchants.csv"
  end

  def contents
    @contents ||= CSV.open(path, headers: true, header_converters: :symbol)
  end

  def start
    contents.each do |row|
      merchant = Merchant.create(name: row[:name], created_at: row[:created_at], updated_at: row[:updated_at])
      puts "merchant #{merchant.name} created"
    end
  end
end
