json.extract! product, :id, :title, :category_id, :quantity, :description, :label, :price, :store_id, :description, :organic, :created_at, :updated_at
json.url product_url(product, format: :json)
