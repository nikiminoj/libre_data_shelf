require "application_system_test_case"

class ShelfDailyStatsTest < ApplicationSystemTestCase
  setup do
    @shelf_daily_stat = shelf_daily_stats(:one)
  end

  test "visiting the index" do
    visit shelf_daily_stats_url
    assert_selector "h1", text: "Shelf daily stats"
  end

  test "should create shelf daily stat" do
    visit shelf_daily_stats_url
    click_on "New shelf daily stat"

    click_on "Create Shelf daily stat"

    assert_text "Shelf daily stat was successfully created"
    click_on "Back"
  end

  test "should update Shelf daily stat" do
    visit shelf_daily_stat_url(@shelf_daily_stat)
    click_on "Edit this shelf daily stat", match: :first

    click_on "Update Shelf daily stat"

    assert_text "Shelf daily stat was successfully updated"
    click_on "Back"
  end

  test "should destroy Shelf daily stat" do
    visit shelf_daily_stat_url(@shelf_daily_stat)
    click_on "Destroy this shelf daily stat", match: :first

    assert_text "Shelf daily stat was successfully destroyed"
  end
end
