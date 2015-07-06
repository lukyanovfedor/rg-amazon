class Country < ActiveRecord::Base
  has_many :addresses

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save do
    self.name.capitalize!
  end
end
