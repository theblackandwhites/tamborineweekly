class AddCompletedToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :completed, :boolean
  end
end
