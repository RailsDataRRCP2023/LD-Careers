class Payment < ApplicationRecord
  has_many :orders

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "payment_method_id", "status", "total_cents", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
