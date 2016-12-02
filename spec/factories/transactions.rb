FactoryGirl.define do
  factory :transaction do
    credit_card_number "1234567891234"
    result "Result"
    credit_card_expiration_date "2016-11-28 17:54:38"
    invoice
  end
end
