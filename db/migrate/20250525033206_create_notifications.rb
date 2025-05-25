class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.integer :status, null: false
      t.text :message
      t.datetime :read_at
      t.datetime :deleted_at
      t.bigint :notifiable_id
      t.string :notifiable_type
      t.timestamps
    end

    add_index :notifications, [ :notifiable_id, :notifiable_type ]
    add_index :notifications, [ :created_at ]
    add_index :notifications, [ :updated_at ]
    add_index :notifications, [ :read_at ]
    add_index :notifications, [ :deleted_at ]
  end
end
