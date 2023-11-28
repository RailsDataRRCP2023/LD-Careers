class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :image_url, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "id_value", "image_url", "name", "price_cents", "quantity", "updated_at"]
  end
end
