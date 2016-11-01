require 'test_helper'

class RestaurantOwnersControllerTest < ActionController::TestCase
  setup do
    @restaurant_owner = restaurant_owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurant_owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant_owner" do
    assert_difference('RestaurantOwner.count') do
      post :create, restaurant_owner: { restaurant_id: @restaurant_owner.restaurant_id, user_id: @restaurant_owner.user_id }
    end

    assert_redirected_to restaurant_owner_path(assigns(:restaurant_owner))
  end

  test "should show restaurant_owner" do
    get :show, id: @restaurant_owner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant_owner
    assert_response :success
  end

  test "should update restaurant_owner" do
    patch :update, id: @restaurant_owner, restaurant_owner: { restaurant_id: @restaurant_owner.restaurant_id, user_id: @restaurant_owner.user_id }
    assert_redirected_to restaurant_owner_path(assigns(:restaurant_owner))
  end

  test "should destroy restaurant_owner" do
    assert_difference('RestaurantOwner.count', -1) do
      delete :destroy, id: @restaurant_owner
    end

    assert_redirected_to restaurant_owners_path
  end
end
