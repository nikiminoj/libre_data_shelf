class CreateShelfDailyStats < ActiveRecord::Migration[7.2]
  def change
    create_table :shelf_daily_stats do |t|
      t.belongs_to :shelf, foreign_key: true, null: false
      t.date :date
      t.decimal :max_temperature, precision: 6, scale: 2
      t.decimal :min_temperature, precision: 6, scale: 2
      t.integer :product_count_decrement
      t.decimal :weight, precision: 8, scale: 2
      t.integer :product_count_violation_count, default: 0
      t.integer :product_count_violation_duration
      t.integer :temperature_violation_count, default: 0
      t.integer :temperature_violation_duration
      t.timestamps
    end
  end
end
