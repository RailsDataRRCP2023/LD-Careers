class Payment < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    ["amount_cents", "created_at", "id", "id_value", "order_id", "payment_method_id", "status", "updated_at"]
  end
end
