class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
