# frozen_string_literal: true

class DeviseCreatePaymentMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_methods do |t|
      ## Database authenticatable
      t.string :name,              null: false, default: ""
      t.text :description,              null: false, default: ""

      t.timestamps null: false
    end

    add_index :payment_methods, :name,                unique: true
  end
end
