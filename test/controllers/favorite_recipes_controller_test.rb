require 'test_helper'

class FavoriteRecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_recipes_create_url
    assert_response :success
  end

  test "should get index" do
    get favorite_recipes_index_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_recipes_destroy_url
    assert_response :success
  end

end
