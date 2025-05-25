class CreateShelfDailyStats < ActiveRecord::Migration[7.2]
  def change
    create_table :shelf_daily_stats do |t|
      t.timestamps
    end
  end
end
