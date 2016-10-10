require 'test_helper'

class DeliveryLocationsControllerTest < ActionController::TestCase
  setup do
    @delivery_location = delivery_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delivery_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivery_location" do
    assert_difference('DeliveryLocation.count') do
      post :create, delivery_location: { location: @delivery_location.location }
    end

    assert_redirected_to delivery_location_path(assigns(:delivery_location))
  end

  test "should show delivery_location" do
    get :show, id: @delivery_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delivery_location
    assert_response :success
  end

  test "should update delivery_location" do
    patch :update, id: @delivery_location, delivery_location: { location: @delivery_location.location }
    assert_redirected_to delivery_location_path(assigns(:delivery_location))
  end

  test "should destroy delivery_location" do
    assert_difference('DeliveryLocation.count', -1) do
      delete :destroy, id: @delivery_location
    end

    assert_redirected_to delivery_locations_path
  end
end
