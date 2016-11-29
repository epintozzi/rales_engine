FactoryGirl.define do
  factory :invoice_item do
    unit_price 1
    quantity 1
    item
    invoice 
  end
end
