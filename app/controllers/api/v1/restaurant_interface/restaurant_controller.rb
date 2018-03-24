class Api::V1::RestaurantInterface::RestaurantsController < Api::V1::BaseController
    def save_location
        restaurant_id = params[:id]
        @restaurant.find(restaurant_id)
        if @restaurant
            lat = params[:lat]
            lng = params[:lng]
            if lat && lng
                @restaurant.update(lat: lat, lng: lng)
            end

        end
    end
end