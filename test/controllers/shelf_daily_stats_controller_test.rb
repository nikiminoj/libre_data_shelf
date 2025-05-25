require "test_helper"

class ShelfDailyStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shelf_daily_stat = shelf_daily_stats(:one)
  end

  test "should get index" do
    get shelf_daily_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_shelf_daily_stat_url
    assert_response :success
  end

  test "should create shelf_daily_stat" do
    assert_difference("ShelfDailyStat.count") do
      post shelf_daily_stats_url, params: { shelf_daily_stat: {} }
    end

    assert_redirected_to shelf_daily_stat_url(ShelfDailyStat.last)
  end

  test "should show shelf_daily_stat" do
    get shelf_daily_stat_url(@shelf_daily_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_shelf_daily_stat_url(@shelf_daily_stat)
    assert_response :success
  end

  test "should update shelf_daily_stat" do
    patch shelf_daily_stat_url(@shelf_daily_stat), params: { shelf_daily_stat: {} }
    assert_redirected_to shelf_daily_stat_url(@shelf_daily_stat)
  end

  test "should destroy shelf_daily_stat" do
    assert_difference("ShelfDailyStat.count", -1) do
      delete shelf_daily_stat_url(@shelf_daily_stat)
    end

    assert_redirected_to shelf_daily_stats_url
  end
end
