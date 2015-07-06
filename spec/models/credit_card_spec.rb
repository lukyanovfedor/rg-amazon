require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  subject(:credit_card) { FactoryGirl.create :credit_card }

  context "validation" do
    it { expect(credit_card).to validate_presence_of(:number) }
    it { expect(credit_card).to validate_presence_of(:CVV) }
    it { expect(credit_card).to validate_presence_of(:expiration_month) }
    it { expect(credit_card).to validate_presence_of(:expiration_year) }
    it { expect(credit_card).to validate_presence_of(:first_name) }
    it { expect(credit_card).to validate_presence_of(:last_name) }
    it { expect(credit_card).to validate_numericality_of(:CVV).only_integer }
    it { expect(credit_card).to validate_numericality_of(:expiration_month).only_integer }
    it { expect(credit_card).to validate_numericality_of(:expiration_year).only_integer }
  end

  context "belongs_to" do
    it { expect(credit_card).to belong_to(:customer) }
  end

  context "has_many" do
    it { expect(credit_card).to have_many(:orders) }
  end
end
