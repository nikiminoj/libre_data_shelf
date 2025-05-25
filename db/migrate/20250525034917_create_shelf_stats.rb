class CreateShelfStats < ActiveRecord::Migration[7.2]
  def change
    create_table :shelf_stats do |t|
      t.integer :weight
      t.integer :weight_percent
      t.integer :product_count
      t.integer :product_count_real
      t.boolean :temperature_violation
      t.integer :timedelta
      t.integer :weight_increment
      t.integer :weight_decrement
      t.belongs_to :shelf, foreign_key: true, null: false
      t.timestamps
    end
  end
end
