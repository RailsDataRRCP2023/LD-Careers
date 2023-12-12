class Order < ApplicationRecord
  belongs_to :customer
  # belongs_to :payment
  has_many :order_items

  validates :status, presence: true
  validates :stripe_session_id, presence: true
  validates :total_price_cents, presence: true
  validates :customer_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "payment_method_id", "status", "total_price_cents", "updated_at", "customer_id", "stripe_session_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "payment", "order_items"]
  end
end
