class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :postcode, :string
    add_column :users, :local, :boolean
    add_column :users, :phone, :string
    add_column :users, :bio, :text
  end
end
