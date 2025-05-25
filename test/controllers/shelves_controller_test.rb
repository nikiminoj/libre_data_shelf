require "test_helper"

class ShelvesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shelf = shelves(:one)
  end

  test "should get index" do
    get shelves_url
    assert_response :success
  end

  test "should get new" do
    get new_shelf_url
    assert_response :success
  end

  test "should create shelf" do
    assert_difference("Shelf.count") do
      post shelves_url, params: { shelf: { comment: @shelf.comment, company_id: @shelf.company_id, grap_shelf_stat: @shelf.grap_shelf_stat, last_shelf_stat: @shelf.last_shelf_stat, mac_address: @shelf.mac_address, mac_weight: @shelf.mac_weight, product_id: @shelf.product_id, refill_shelf_stat: @shelf.refill_shelf_stat } }
    end

    assert_redirected_to shelf_url(Shelf.last)
  end

  test "should show shelf" do
    get shelf_url(@shelf)
    assert_response :success
  end

  test "should get edit" do
    get edit_shelf_url(@shelf)
    assert_response :success
  end

  test "should update shelf" do
    patch shelf_url(@shelf), params: { shelf: { comment: @shelf.comment, company_id: @shelf.company_id, grap_shelf_stat: @shelf.grap_shelf_stat, last_shelf_stat: @shelf.last_shelf_stat, mac_address: @shelf.mac_address, mac_weight: @shelf.mac_weight, product_id: @shelf.product_id, refill_shelf_stat: @shelf.refill_shelf_stat } }
    assert_redirected_to shelf_url(@shelf)
  end

  test "should destroy shelf" do
    assert_difference("Shelf.count", -1) do
      delete shelf_url(@shelf)
    end

    assert_redirected_to shelves_url
  end
end
