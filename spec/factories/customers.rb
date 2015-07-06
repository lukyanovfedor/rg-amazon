FactoryGirl.define do
  sequence :customer_email do |n|
    "#{n}#{Faker::Internet.free_email}"
  end

  factory :customer do
    email { FactoryGirl.generate(:customer_email) }
    password { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

end
