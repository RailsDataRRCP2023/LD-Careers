# frozen_string_literal: true

class DeviseCreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      ## Database authenticatable
      t.string :name,              null: false, default: ""
      t.text :description,              null: false, default: ""

      t.timestamps null: false
    end

    add_index :categories, :name,                unique: true
  end
end
