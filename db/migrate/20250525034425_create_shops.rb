class CreateShops < ActiveRecord::Migration[7.2]
  def change
    create_table :shops do |t|
      t.string :address
      t.string :contact_name
      t.string :contact_number
      t.string :comment
      t.time :open_at
      t.time :close_at
      t.integer :commercial_network
      t.belongs_to :company, foreign_key: true, null: false
      t.belongs_to :city, foreign_key: false, null: true
      t.timestamps
    end
  end
end
