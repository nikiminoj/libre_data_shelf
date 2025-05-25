class CreateModelLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :model_logs do |t|
      t.string :action
      t.string :entity_name
      t.bigint :entity_type
      t.belongs_to :company, foreign_key: true, null: true
      t.belongs_to :user, foreign_key: true, null: true
      t.timestamps
    end

    add_index :model_logs, :action
    add_index :model_logs, :entity_name
    add_index :model_logs, :entity_type
  end
end
