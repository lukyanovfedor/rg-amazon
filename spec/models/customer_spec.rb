require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject(:customer) { FactoryGirl.create(:customer) }

  context "validation" do
    it { expect(customer).to validate_presence_of(:email) }
    it { expect(customer).to validate_presence_of(:password) }
    it { expect(customer).to validate_presence_of(:first_name) }
    it { expect(customer).to validate_presence_of(:last_name) }
    it { expect(customer).to validate_uniqueness_of(:email) }
  end

  context "has_many" do
    it { expect(customer).to have_many(:ratings) }
    it { expect(customer).to have_many(:orders) }
  end

  context "before_create" do
    it "should crypt password" do
      password = "super!strong!password"
      customer = FactoryGirl.create(:customer, password: password)
      
      expect(customer.password).not_to eq password
    end
  end

  context "read_only_attributes" do
    it { expect(customer).to have_readonly_attribute(:password) }
  end

  context "#current_orders" do
    it "should call Order.in_progress" do
      expect(Order).to receive(:in_progress)
      
      customer.current_orders
    end
  end

  context "#create_order" do
    it "should return Order" do
      expect(subject.create_order).to be_kind_of(Order)
    end

    it "should not save order in database" do
      order = subject.create_order
     
      expect(order.new_record?).to eq true
    end
  end
end
