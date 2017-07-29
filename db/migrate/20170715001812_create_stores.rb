class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :address
      t.text :pickup_details
      t.text :open_times

      t.timestamps
    end
  end
end
