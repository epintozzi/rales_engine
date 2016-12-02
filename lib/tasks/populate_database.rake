require 'csv'

namespace :populate_database do

  desc "TODO"
  task populate_merchants: :environment do
    csv_text = File.read('./data/merchants.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| Merchant.find_or_create_by(row.to_hash) }
  end

  desc "TODO"
  task populate_customers: :environment do
    csv_text = File.read('./data/customers.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| Customer.find_or_create_by(row.to_hash) }
  end

  desc "TODO"
  task populate_invoices: :environment do
    csv_text = File.read('./data/invoices.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| Invoice.find_or_create_by(row.to_hash) }
  end

  desc "TODO"
  task populate_transactions: :environment do
    csv_text = File.read('./data/transactions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| Transaction.find_or_create_by(row.to_hash) }

  end

  desc "TODO"
  task populate_items: :environment do
    csv_text = File.read('./data/items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| Item.find_or_create_by(row.to_hash) }

  end

  desc "TODO"
  task populate_invoice_items: :environment do
    csv_text = File.read('./data/invoice_items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| InvoiceItem.find_or_create_by(row.to_hash) }
  end

  desc "perform all populating"
  task :populate_all do
    Rake::Task['populate_database:populate_merchants'].invoke
    Rake::Task['populate_database:populate_customers'].invoke
    Rake::Task['populate_database:populate_invoices'].invoke
    Rake::Task['populate_database:populate_transactions'].invoke
    Rake::Task['populate_database:populate_items'].invoke
    Rake::Task['populate_database:populate_invoice_items'].invoke
  end
end


# enter into console to populate database
#
#rake populate_database:populate_all
#
# rake populate_database:populate_merchants
# rake populate_database:populate_customers
# rake populate_database:populate_items
# rake populate_database:populate_invoices
# rake populate_database:populate_invoice_items
# rake populate_database:populate_transactions
