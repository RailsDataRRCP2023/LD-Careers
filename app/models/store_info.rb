class StoreInfo < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :about, presence: true
    validates :address, presence: true
    validates :phone, presence: true
    validates :email, presence: true
    validates :logo_url, presence: true
    
    def self.ransackable_attributes(auth_object = nil)
        ["about", "created_at", "id", "id_value", "name", "updated_at", "address", "phone", "email", "logo_url"]
    end
end
