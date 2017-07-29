class Product < ApplicationRecord
  belongs_to :category
  belongs_to :store
  has_many :carts, dependent: :destroy
  has_many :lists, dependent: :destroy

  has_attachment  :photo, accept: [:jpg, :png, :gif]
end
