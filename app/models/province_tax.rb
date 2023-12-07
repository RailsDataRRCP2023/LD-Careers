class ProvinceTax < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    validates :gst, presence: true
    validates :pst, presence: true
    
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "gst", "id", "id_value", "name", "pst", "updated_at"]
    end
end
