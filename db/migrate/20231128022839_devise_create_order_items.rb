# frozen_string_literal: true

class DeviseCreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      ## Database authenticatable
      t.integer :quantity,              null: false, default: 0
      t.integer :unit_price_cents,              null: false, default: 0
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :order_items, :quantity,                unique: false
  end
end
