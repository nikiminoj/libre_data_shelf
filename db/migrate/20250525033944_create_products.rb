class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :vendor_code
      t.integer :unit_weight
      t.integer :min_storage_temperature
      t.integer :max_storage_temperature
      t.integer :capacity_yellow
      t.integer :capacity_red
      t.belongs_to :company, foreign_key: true
      t.belongs_to :product_group, foreign_key: false, null: true
      t.timestamps
    end
  end
end
