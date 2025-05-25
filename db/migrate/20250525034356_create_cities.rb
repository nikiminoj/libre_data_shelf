class CreateCities < ActiveRecord::Migration[7.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.belongs_to :company, foreign_key: true
      t.belongs_to :region, foreign_key: true
      t.timestamps
    end
  end
end
