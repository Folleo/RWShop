json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :category_id, :price
  json.url product_url(product, format: :json)
end
