FactoryGirl.define do
  factory :credit_card do
    number { Faker::Number.number(16) }
    CVV { Faker::Number.number(3) }
    expiration_month "03"
    expiration_year "18"
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    customer
  end

end
