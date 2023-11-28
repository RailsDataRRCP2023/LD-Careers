# frozen_string_literal: true

class DeviseCreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      ## Database authenticatable
      t.string :status,              null: false, default: "pending"
      t.integer :total_price_cents,              null: false, default: 0
      t.references :customer, null: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :orders, :status,                unique: false
  end
end
