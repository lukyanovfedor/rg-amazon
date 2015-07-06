require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:order) { FactoryGirl.create(:order) }

  context "validation" do
    xit { expect(order).to validate_presence_of(:total_price) }
    it { expect(order).to validate_presence_of(:completed_at) }
    xit { expect(order).to validate_presence_of(:state) }
    xit { expect(order).to validate_numericality_of(:total_price) }
    it { expect(order).to validate_inclusion_of(:state).in_array(Order::STATES.values) }
  end

  context "belongs_to" do
    it { expect(order).to belong_to(:customer) }
    it { expect(order).to belong_to(:credit_card) }
    it { expect(order).to belong_to(:billing_address) }
    it { expect(order).to belong_to(:shipping_address) }
  end

  context "has_many" do
    it { expect(order).to have_many(:order_items) }
  end

  context "before_validation" do
    let(:new_order) { Order.new(completed_at: "2015-07-06 00:00:00") }

    it "should call default values" do
      expect(new_order).to receive(:default_values)
      new_order.save
    end

    it "should set total_price" do
      new_order.save
      expect(new_order.total_price).not_to eq nil
    end

    it "should set state" do
      new_order.save
      expect(new_order.state).not_to eq nil
    end
  end

  context "scopes" do
    let(:in_progress) { FactoryGirl.create_list(:order, 3, :progress) }

    it "should return in progress orders" do
      expect(Order.in_progress).to match_array(in_progress)
    end
  end

  context "#calculate_total_price" do
    it "should return sum of price*quantity of order_items" do
      2.times { FactoryGirl.create(:order_item, price: 10, quantity: 2, order: order) }

      order.order_items.reload

      expect(order.calculate_total_price).to eq 40.0
    end
  end

  context "#add_book" do
    it "should add book to order, when she not present in order" do
      book = FactoryGirl.create(:book)

      order.add_book(book)

      order.order_items.reload

      expect(order.order_items.size).to eq 1
    end

    it "should encrease quantity by n, when book present in order" do
      book = FactoryGirl.create(:book)

      order.add_book(book, 2)
      order.add_book(book, 2)

      order.order_items.reload

      expect(order.order_items.where(book: book).first.quantity).to eq 4
    end
  end
end
