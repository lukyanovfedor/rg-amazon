require 'rails_helper'

RSpec.describe Address, type: :model do
  subject(:address) { FactoryGirl.create :address }

  context "validation" do
    it { expect(address).to validate_presence_of(:address) }
    it { expect(address).to validate_presence_of(:zipcode) }
    it { expect(address).to validate_presence_of(:city) }
    it { expect(address).to validate_presence_of(:phone) }
  end

  context "belongs_to" do
    it { expect(address).to belong_to(:country) }
  end
end
