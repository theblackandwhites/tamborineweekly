class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :session_id

      t.timestamps
    end
  end
end
