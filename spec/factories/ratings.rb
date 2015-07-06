FactoryGirl.define do
  factory :rating do
    review { Faker::Lorem.paragraph }
    rating_number { (1..10).to_a.sample }

    book
    customer
  end

end
