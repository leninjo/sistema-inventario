class CreateWareHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :ware_houses do |t|
      t.integer :cantidad

      t.timestamps
    end
  end
end
