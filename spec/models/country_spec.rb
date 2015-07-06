require 'rails_helper'

RSpec.describe Country, type: :model do
  subject(:country) { FactoryGirl.create :country }

  context "validation" do
    it { expect(country).to validate_presence_of(:name) }
    it { expect(country).to validate_uniqueness_of(:name).case_insensitive }
  end

  context "has_many" do
    it { expect(country).to have_many(:addresses) }
  end

  context "before_save" do
    it "should capitalize name" do
      name = "ENGLAND"
      category = FactoryGirl.create(:country, name: name)
      
      expect(category.name).to eq name.capitalize
    end
  end
end
