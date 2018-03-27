class Api::V1::RestaurantInterface::RestaurantOwnersController < Api::V1::BaseController
    def save_location
        @restaurant = User.find(params[:id]).restaurant_owners.first.restaurant
        if @restaurant.update(lat: params[:lat], lng: params[:lng])
            render(json: Api::V1::RestaurantInterface::RestaurantSerializer.new(@restaurant).to_json)
        end
    end
end
