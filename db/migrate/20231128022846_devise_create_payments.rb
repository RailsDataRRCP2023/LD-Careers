# frozen_string_literal: true

class DeviseCreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      ## Database authenticatable
      t.string :status,              null: false, default: "pending"
      t.integer :amount_cents,              null: false, default: 0
      t.references :payment_method, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :payments, :status,                unique: false
  end
end
