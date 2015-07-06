class Order < ActiveRecord::Base
  STATES = {
    progress: "in progress",
    completed: "completed",
    shipped: "shipped"
  }

  belongs_to :customer
  belongs_to :credit_card
  belongs_to :billing_address, class_name: "Address"
  belongs_to :shipping_address, class_name: "Address"

  has_many :order_items 

  validates :total_price, :completed_at, :state, presence: true
  validates :total_price, numericality: true
  validates :state, inclusion: { in: STATES.values}

  before_validation :default_values

  scope :in_progress, -> { where(state: STATES[:progress]) }

  def add_book(book, quantity = 1)
    order_item = self.order_items.where(book: book).first

    if order_item
      order_item.update(quantity: order_item.quantity + quantity)
    else
      OrderItem.create(price: book.price, quantity: quantity, book: book, order: self)
    end
  end

  def calculate_total_price
    self.order_items.inject(0) { |sum, item| sum + item.price * item.quantity }
  end
  
  private
    def default_values
      self.state ||= STATES[:progress]
      self.total_price = calculate_total_price
    end
end
