json.extract! order_restaurant, :id, :restaurant_id, :order_id, :created_at, :updated_at
json.url order_restaurant_url(order_restaurant, format: :json)