FactoryGirl.define do
  factory :order_item do
    price { Faker::Commerce.price }
    quantity { (1..10).to_a.sample }

    book
    order
  end

end
