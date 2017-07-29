class AddUpdatedQuantityToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :updated_quantity, :integer
  end
end
