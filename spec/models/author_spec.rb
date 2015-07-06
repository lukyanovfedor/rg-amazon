require 'rails_helper'

RSpec.describe Author, type: :model do
  subject(:author) { FactoryGirl.create :author }

  context "validation" do
    it { expect(author).to validate_presence_of(:first_name) }
    it { expect(author).to validate_presence_of(:last_name) }
  end

  context "has_many" do
    it { expect(author).to have_many(:books) }
  end
end
