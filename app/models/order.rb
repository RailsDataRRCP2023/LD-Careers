class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :payment
  has_many :order_items

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "payment_method_id", "status", "total_cents", "updated_at", "customer_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "payment", "order_items"]
  end
end
