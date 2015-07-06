class Customer < ActiveRecord::Base
  has_many :ratings
  has_many :orders

  attr_readonly :password

  validates :email, :password, :first_name, :last_name, presence: true
  validates :email, uniqueness: true 

  @@salt = 'lksdjlfgj3i4uy58u32iuhkd'.freeze

  before_create :crypt_pass

  def create_order
    Order.new(customer: self)
  end

  def current_orders
    orders.in_progress
  end

  private
    def crypt_pass
      self.password = Digest::SHA2.hexdigest(password + @@salt)
    end
end
