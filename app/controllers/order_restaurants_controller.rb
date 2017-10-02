class OrderRestaurantsController < ApplicationController
  before_action :set_order_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /order_restaurants
  # GET /order_restaurants.json
  def index
    @order_restaurants = OrderRestaurant.all
  end

  # GET /order_restaurants/1
  # GET /order_restaurants/1.json
  def show
  end

  # GET /order_restaurants/new
  def new
    @order_restaurant = OrderRestaurant.new
  end

  # GET /order_restaurants/1/edit
  def edit
  end

  # POST /order_restaurants
  # POST /order_restaurants.json
  def create
    @order_restaurant = OrderRestaurant.new(order_restaurant_params)

    respond_to do |format|
      if @order_restaurant.save
        format.html { redirect_to @order_restaurant, notice: 'Order restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @order_restaurant }
      else
        format.html { render :new }
        format.json { render json: @order_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_restaurants/1
  # PATCH/PUT /order_restaurants/1.json
  def update
    respond_to do |format|
      if @order_restaurant.update(order_restaurant_params)
        format.html { redirect_to @order_restaurant, notice: 'Order restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_restaurant }
      else
        format.html { render :edit }
        format.json { render json: @order_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_restaurants/1
  # DELETE /order_restaurants/1.json
  def destroy
    @order_restaurant.destroy
    respond_to do |format|
      format.html { redirect_to order_restaurants_url, notice: 'Order restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_order_confirm
      @order = Order.find(params[:order_id])
      @order_restaurant = OrderRestaurant.find(params[:order_restaurant_id])
      @order_restaurant.confirm_user()
      respond_to do |format|
          format.html { render partial: 'orders/cards',  :locals => {:order => @orders}}
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_restaurant
      @order_restaurant = OrderRestaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_restaurant_params
      params.require(:order_restaurant).permit(:restaurant_id, :order_id)
    end
end
