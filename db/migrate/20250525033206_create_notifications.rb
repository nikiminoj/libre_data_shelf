class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.integer :status, null: false
      t.text :message
      t.bigint :notifiable_id
      t.string :notifiable_type
      t.timestamps
    end
  end
end
