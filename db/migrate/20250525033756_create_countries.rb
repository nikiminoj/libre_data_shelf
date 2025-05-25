class CreateCountries < ActiveRecord::Migration[7.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.belongs_to :company, foreign_key: true
      t.timestamps
    end
  end
end
