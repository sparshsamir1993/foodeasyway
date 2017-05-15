class Api::V1::RestaurantsController < Api::V1::BaseController
    before_action :authenticate_user!
    attr_writer :name, :contact, :avatar, :min_order

    def index
       restaurants = Restaurant.all

       render json: restaurants,
           each_serializer: Api::V1::RestaurantSerializer
     end
    def show
      @restaurant = Restaurant.find(params[:id])
      render(json: Api::V1::RestaurantSerializer.new(@restaurant).to_json)
    end
end
