require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { FactoryGirl.create :book }

  context "validation" do
    it { expect(book).to validate_presence_of(:title) }
    it { expect(book).to validate_presence_of(:price) }
    it { expect(book).to validate_presence_of(:books_in_stock) }
    it { expect(book).to validate_numericality_of(:price) }
    it { expect(book).to validate_numericality_of(:books_in_stock).only_integer }
  end

  context "belongs_to" do
    it { expect(book).to belong_to(:author) }
    it { expect(book).to belong_to(:category) }
  end

  context "has_many" do
    it { expect(book).to have_many(:ratings) }
  end
end
