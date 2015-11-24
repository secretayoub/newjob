json.array!(@customer_customers) do |customer_customer|
  json.extract! customer_customer, :id
  json.url customer_customer_url(customer_customer, format: :json)
end
