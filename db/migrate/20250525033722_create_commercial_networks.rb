class CreateCommercialNetworks < ActiveRecord::Migration[7.2]
  def change
    create_table :commercial_networks do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_number
      t.string :comment
      t.belongs_to :company, foreign_key: true, null: false
      t.timestamps
    end
  end
end
