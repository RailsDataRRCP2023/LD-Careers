class CreateIndices < ActiveRecord::Migration[7.1]
  def change
    create_table :indices do |t|

      t.timestamps
    end
  end
end
