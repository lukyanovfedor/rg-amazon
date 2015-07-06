FactoryGirl.define do
  factory :book do
    title { Faker::Lorem.word }
    descirption { Faker::Lorem.sentence }
    price { Faker::Commerce.price }
    books_in_stock { (1..10).to_a.sample }

    category
    author
  end

end
