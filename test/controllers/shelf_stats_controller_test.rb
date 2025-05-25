require "test_helper"

class ShelfStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shelf_stat = shelf_stats(:one)
  end

  test "should get index" do
    get shelf_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_shelf_stat_url
    assert_response :success
  end

  test "should create shelf_stat" do
    assert_difference("ShelfStat.count") do
      post shelf_stats_url, params: { shelf_stat: { product_count: @shelf_stat.product_count, product_count_real: @shelf_stat.product_count_real, shelf_id: @shelf_stat.shelf_id, temperature_violation: @shelf_stat.temperature_violation, timedelta: @shelf_stat.timedelta, weight: @shelf_stat.weight, weight_decrement: @shelf_stat.weight_decrement, weight_increment: @shelf_stat.weight_increment, weight_percent: @shelf_stat.weight_percent } }
    end

    assert_redirected_to shelf_stat_url(ShelfStat.last)
  end

  test "should show shelf_stat" do
    get shelf_stat_url(@shelf_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_shelf_stat_url(@shelf_stat)
    assert_response :success
  end

  test "should update shelf_stat" do
    patch shelf_stat_url(@shelf_stat), params: { shelf_stat: { product_count: @shelf_stat.product_count, product_count_real: @shelf_stat.product_count_real, shelf_id: @shelf_stat.shelf_id, temperature_violation: @shelf_stat.temperature_violation, timedelta: @shelf_stat.timedelta, weight: @shelf_stat.weight, weight_decrement: @shelf_stat.weight_decrement, weight_increment: @shelf_stat.weight_increment, weight_percent: @shelf_stat.weight_percent } }
    assert_redirected_to shelf_stat_url(@shelf_stat)
  end

  test "should destroy shelf_stat" do
    assert_difference("ShelfStat.count", -1) do
      delete shelf_stat_url(@shelf_stat)
    end

    assert_redirected_to shelf_stats_url
  end
end
