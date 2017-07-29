class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.references :category, foreign_key: true
      t.string :quantity
      t.text :description
      t.string :label
      t.decimal :price
      t.references :store, foreign_key: true
      t.boolean :organic

      t.timestamps
    end
  end
end
