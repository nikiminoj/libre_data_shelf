class CreateProductGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :product_groups do |t|
      t.belongs_to :company, foreign_key: true
      t.string :name
      t.string :comment
      t.timestamps
    end
  end
end
