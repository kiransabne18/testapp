require 'test_helper'

class StreetFoodsControllerTest < ActionController::TestCase
  setup do
    @street_food = street_foods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:street_foods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create street_food" do
    assert_difference('StreetFood.count') do
      post :create, street_food: { address: @street_food.address, name: @street_food.name }
    end

    assert_redirected_to street_food_path(assigns(:street_food))
  end

  test "should show street_food" do
    get :show, id: @street_food
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @street_food
    assert_response :success
  end

  test "should update street_food" do
    patch :update, id: @street_food, street_food: { address: @street_food.address, name: @street_food.name }
    assert_redirected_to street_food_path(assigns(:street_food))
  end

  test "should destroy street_food" do
    assert_difference('StreetFood.count', -1) do
      delete :destroy, id: @street_food
    end

    assert_redirected_to street_foods_path
  end
end
