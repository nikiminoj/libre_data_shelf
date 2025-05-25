require "application_system_test_case"

class ShelfStatsTest < ApplicationSystemTestCase
  setup do
    @shelf_stat = shelf_stats(:one)
  end

  test "visiting the index" do
    visit shelf_stats_url
    assert_selector "h1", text: "Shelf stats"
  end

  test "should create shelf stat" do
    visit shelf_stats_url
    click_on "New shelf stat"

    fill_in "Product count", with: @shelf_stat.product_count
    fill_in "Product count real", with: @shelf_stat.product_count_real
    fill_in "Shelf", with: @shelf_stat.shelf_id
    check "Temperature violation" if @shelf_stat.temperature_violation
    fill_in "Timedelta", with: @shelf_stat.timedelta
    fill_in "Weight", with: @shelf_stat.weight
    fill_in "Weight decrement", with: @shelf_stat.weight_decrement
    fill_in "Weight increment", with: @shelf_stat.weight_increment
    fill_in "Weight percent", with: @shelf_stat.weight_percent
    click_on "Create Shelf stat"

    assert_text "Shelf stat was successfully created"
    click_on "Back"
  end

  test "should update Shelf stat" do
    visit shelf_stat_url(@shelf_stat)
    click_on "Edit this shelf stat", match: :first

    fill_in "Product count", with: @shelf_stat.product_count
    fill_in "Product count real", with: @shelf_stat.product_count_real
    fill_in "Shelf", with: @shelf_stat.shelf_id
    check "Temperature violation" if @shelf_stat.temperature_violation
    fill_in "Timedelta", with: @shelf_stat.timedelta
    fill_in "Weight", with: @shelf_stat.weight
    fill_in "Weight decrement", with: @shelf_stat.weight_decrement
    fill_in "Weight increment", with: @shelf_stat.weight_increment
    fill_in "Weight percent", with: @shelf_stat.weight_percent
    click_on "Update Shelf stat"

    assert_text "Shelf stat was successfully updated"
    click_on "Back"
  end

  test "should destroy Shelf stat" do
    visit shelf_stat_url(@shelf_stat)
    click_on "Destroy this shelf stat", match: :first

    assert_text "Shelf stat was successfully destroyed"
  end
end
