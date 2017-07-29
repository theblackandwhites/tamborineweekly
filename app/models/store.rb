class Store < ApplicationRecord
	has_attachment  :store_front, accept: [:jpg, :png, :gif], dependent: :destroy
	has_many :products, dependent: :destroy
end
