require "test_helper"

class WishlistItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get wishlist_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get wishlist_items_destroy_url
    assert_response :success
  end
end
