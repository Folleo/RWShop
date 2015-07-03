json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :discount_percent, :discount_amount, :image
  json.url category_url(category, format: :json)
end
