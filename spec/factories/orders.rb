FactoryGirl.define do
  factory :order do
    completed_at { Date.today }

    customer
    credit_card
    
    association :billing_address, factory: :address
    association :shipping_address, factory: :address

    trait :progress do
      state Order::STATES[:progress]
    end

    trait :shipped do
      state Order::STATES[:shipped]
    end

    trait :completed do
      state Order::STATES[:completed]
    end
  end

end
