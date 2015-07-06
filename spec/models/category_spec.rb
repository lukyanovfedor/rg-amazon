require 'rails_helper'

RSpec.describe Category, type: :model do
  subject(:category) { FactoryGirl.create(:category) }

  context "validation" do
    it { expect(category).to validate_presence_of(:title) }
    it { expect(category).to validate_uniqueness_of(:title).case_insensitive }
  end

  context "has_many" do
    it { expect(category).to have_many(:books) }
  end

  context "before_save" do
    it "should capitalize title" do
      title = "encyclopedias"
      category = FactoryGirl.create(:category, title: title)
      
      expect(category.title).to eq title.capitalize
    end
  end
end
