require 'test_helper'

class OrderRestaurantsControllerTest < ActionController::TestCase
  setup do
    @order_restaurant = order_restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_restaurant" do
    assert_difference('OrderRestaurant.count') do
      post :create, order_restaurant: { order_id: @order_restaurant.order_id, restaurant_id: @order_restaurant.restaurant_id }
    end

    assert_redirected_to order_restaurant_path(assigns(:order_restaurant))
  end

  test "should show order_restaurant" do
    get :show, id: @order_restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_restaurant
    assert_response :success
  end

  test "should update order_restaurant" do
    patch :update, id: @order_restaurant, order_restaurant: { order_id: @order_restaurant.order_id, restaurant_id: @order_restaurant.restaurant_id }
    assert_redirected_to order_restaurant_path(assigns(:order_restaurant))
  end

  test "should destroy order_restaurant" do
    assert_difference('OrderRestaurant.count', -1) do
      delete :destroy, id: @order_restaurant
    end

    assert_redirected_to order_restaurants_path
  end
end
