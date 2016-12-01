FactoryGirl.define do
  factory :invoice do
    status "Status"
    merchant
    customer
  end
end
