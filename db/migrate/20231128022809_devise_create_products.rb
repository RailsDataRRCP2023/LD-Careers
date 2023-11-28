# frozen_string_literal: true

class DeviseCreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      ## Database authenticatable
      t.string :name,              null: false, default: ""
      t.text :description,              null: false, default: ""
      t.integer :price_cents,              null: false, default: 0
      t.integer :quantity,              null: false, default: 0
      t.string :image_url,              null: false, default: ""
      t.references :category, null: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :products, :name,                unique: true
  end
end
