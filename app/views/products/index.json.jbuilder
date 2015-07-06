json.array!(@products) do |product|
  json.extract! product, :id, :product_name, :available_sizes, :available_colors
  json.url product_url(product, format: :json)
end
