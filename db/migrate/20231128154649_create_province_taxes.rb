class CreateProvinceTaxes < ActiveRecord::Migration[7.1]
  def change
    create_table :province_taxes do |t|
      t.string :name
      t.decimal :gst, precision: 10, scale: 5
      t.decimal :pst, precision: 10, scale: 5

      t.timestamps
    end
  end
end
