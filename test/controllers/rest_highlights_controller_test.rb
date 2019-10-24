require 'test_helper'

class RestHighlightsControllerTest < ActionController::TestCase
  setup do
    @rest_highlight = rest_highlights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rest_highlights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rest_highlight" do
    assert_difference('RestHighlight.count') do
      post :create, rest_highlight: { highlight_id: @rest_highlight.highlight_id, restaurant_id: @rest_highlight.restaurant_id }
    end

    assert_redirected_to rest_highlight_path(assigns(:rest_highlight))
  end

  test "should show rest_highlight" do
    get :show, id: @rest_highlight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rest_highlight
    assert_response :success
  end

  test "should update rest_highlight" do
    patch :update, id: @rest_highlight, rest_highlight: { highlight_id: @rest_highlight.highlight_id, restaurant_id: @rest_highlight.restaurant_id }
    assert_redirected_to rest_highlight_path(assigns(:rest_highlight))
  end

  test "should destroy rest_highlight" do
    assert_difference('RestHighlight.count', -1) do
      delete :destroy, id: @rest_highlight
    end

    assert_redirected_to rest_highlights_path
  end
end
