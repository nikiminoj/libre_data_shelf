class CreateCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :capacity_yellow
      t.integer :capacity_red
      t.integer :notification_period_yellow
      t.integer :notification_period_red
      t.integer :notification_period_zen
      t.integer :notification_period_temperature
      t.integer :shelf_offline_timeout
      t.timestamps
    end
  end
end
