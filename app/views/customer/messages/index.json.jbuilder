json.array!(@customer_messages) do |customer_message|
  json.extract! customer_message, :id
  json.url customer_message_url(customer_message, format: :json)
end
