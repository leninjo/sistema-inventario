class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :descripcion
      t.string :marca
      t.string :modelo
      t.integer :existencia
      t.decimal :precio
      t.references :category, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
