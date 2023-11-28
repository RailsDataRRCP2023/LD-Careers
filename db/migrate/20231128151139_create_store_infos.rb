class CreateStoreInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :store_infos do |t|
      t.string :name
      t.text :about
      t.string :address
      t.string :phone
      t.string :email
      t.string :logo_url

      t.timestamps
    end
  end
end
