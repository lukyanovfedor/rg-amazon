class OrderItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order

  validates :price, :quantity, presence: true
  validates :price, numericality: true
  validates :quantity, numericality: { only_integer: true }
end
