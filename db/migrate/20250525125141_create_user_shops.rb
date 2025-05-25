class CreateUserShops < ActiveRecord::Migration[7.2]
  def change
    create_table :user_shops do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :shop, foreign_key: true, null: false
      t.timestamps
    end
  end
end
