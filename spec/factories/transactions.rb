FactoryGirl.define do
  factory :transaction do
    credit_card_number 1
    result "MyString"
    credit_card_expiration "2016-11-28 17:54:38"
    invoice nil
  end
end
