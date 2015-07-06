require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  subject(:order_item) { FactoryGirl.create :order_item }

  context "validation" do
    it { expect(order_item).to validate_presence_of(:price) }
    it { expect(order_item).to validate_presence_of(:quantity) }
    it { expect(order_item).to validate_numericality_of(:price) }
    it { expect(order_item).to validate_numericality_of(:quantity).only_integer }
  end

  context "belongs_to" do
    it { expect(order_item).to belong_to(:book) }
    it { expect(order_item).to belong_to(:order) }
  end
end
