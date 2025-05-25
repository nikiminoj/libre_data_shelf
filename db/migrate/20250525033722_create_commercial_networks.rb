class CreateCommercialNetworks < ActiveRecord::Migration[7.2]
  def change
    create_table :commercial_networks do |t|
      t.timestamps
    end
  end
end
