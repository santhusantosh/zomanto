require 'test_helper'

class RestaurantCuisinesControllerTest < ActionController::TestCase
  setup do
    @restaurant_cuisine = restaurant_cuisines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurant_cuisines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant_cuisine" do
    assert_difference('RestaurantCuisine.count') do
      post :create, restaurant_cuisine: { cuisine_id: @restaurant_cuisine.cuisine_id, restaurant_id: @restaurant_cuisine.restaurant_id }
    end

    assert_redirected_to restaurant_cuisine_path(assigns(:restaurant_cuisine))
  end

  test "should show restaurant_cuisine" do
    get :show, id: @restaurant_cuisine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant_cuisine
    assert_response :success
  end

  test "should update restaurant_cuisine" do
    patch :update, id: @restaurant_cuisine, restaurant_cuisine: { cuisine_id: @restaurant_cuisine.cuisine_id, restaurant_id: @restaurant_cuisine.restaurant_id }
    assert_redirected_to restaurant_cuisine_path(assigns(:restaurant_cuisine))
  end

  test "should destroy restaurant_cuisine" do
    assert_difference('RestaurantCuisine.count', -1) do
      delete :destroy, id: @restaurant_cuisine
    end

    assert_redirected_to restaurant_cuisines_path
  end
end
