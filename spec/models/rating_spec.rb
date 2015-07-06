require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject(:rating) { FactoryGirl.create :rating }

  context "validation" do
    it { expect(rating).to validate_presence_of(:review) }
    it { expect(rating).to validate_presence_of(:rating_number) }
    it { expect(rating).to validate_numericality_of(:rating_number).only_integer }
    it { expect(rating).to validate_numericality_of(:rating_number).is_greater_than_or_equal_to(1) }
    it { expect(rating).to validate_numericality_of(:rating_number).is_less_than_or_equal_to(10) }
  end

  context "belongs_to" do
    it { expect(rating).to belong_to(:book) }
    it { expect(rating).to belong_to(:customer) }
  end
end
