class PaymentMethod < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :customer
  has_many :payments

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at", "card_number", "expiration_date", "customer_id", "cvv"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["payments"]
  end
end
