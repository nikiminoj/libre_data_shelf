class CreateShelves < ActiveRecord::Migration[7.2]
  def change
    create_table :shelves do |t|
      t.string :mac_address
      t.integer :mac_weight
      t.string :comment
      t.belongs_to :company, foreign_key: true, null: false
      t.belongs_to :product, foreign_key: true, null: true
      t.integer :last_shelf_stat
      t.integer :refill_shelf_stat
      t.integer :grap_shelf_stat
      t.timestamps
    end
  end
end
