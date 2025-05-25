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

  # Tests for chart_data action
  test "should get chart_data and return success" do
    get shelf_daily_stats_chart_data_url # Make sure this route helper exists or define the path string
    assert_response :success
  end

  test "chart_data should return JSON" do
    get shelf_daily_stats_chart_data_url
    assert_equal "application/json", @response.media_type
  end

  test "chart_data JSON response should have correct structure" do
    get shelf_daily_stats_chart_data_url
    json_response = JSON.parse(@response.body)
    assert_includes json_response, "labels"
    assert_includes json_response, "datasets"
    assert_kind_of Array, json_response["labels"]
    assert_kind_of Array, json_response["datasets"]

    # Check structure of the first dataset if any exist
    if json_response["datasets"].any?
      dataset = json_response["datasets"].first
      assert_includes dataset, "label"
      assert_includes dataset, "data"
      assert_includes dataset, "borderColor"
      assert_includes dataset, "backgroundColor"
    end
  end

  test "chart_data should filter by product_id" do
    product_to_filter = products(:product_for_filtering) # From fixtures
    get shelf_daily_stats_chart_data_url, params: { product_id: product_to_filter.id }
    json_response = JSON.parse(@response.body)

    assert_response :success
    # All returned stats should belong to this product.
    # Based on fixtures, product_for_filtering has 3 entries.
    assert_equal 3, json_response["labels"].count
    json_response["datasets"].each do |dataset|
      assert_equal 3, dataset["data"].count
    end
  end

  test "chart_data should filter by start_date" do
    start_date = Date.today.to_s # Today
    get shelf_daily_stats_chart_data_url, params: { start_date: start_date }
    json_response = JSON.parse(@response.body)

    assert_response :success
    # All dates in labels should be >= today.
    # Fixtures: stat_two_product_one_today, stat_four_product_two_today,
    # stat_for_filter_product_today, stat_for_filter_product_tomorrow
    all_dates_after_start = json_response["labels"].all? { |label_date| Date.parse(label_date) >= Date.parse(start_date) }
    assert all_dates_after_start, "Not all dates in chart_data output are on or after the start_date"
    assert_equal 4, json_response["labels"].count # 2 for today, 2 for tomorrow (for product_for_filtering)
  end

  test "chart_data should filter by end_date" do
    end_date = (Date.today - 1.day).to_s # Yesterday
    get shelf_daily_stats_chart_data_url, params: { end_date: end_date }
    json_response = JSON.parse(@response.body)

    assert_response :success
    # All dates in labels should be <= end_date (yesterday).
    # Fixtures: stat_one_product_one_day_ago, stat_three_product_two_day_ago, stat_for_filter_product_yesterday
    all_dates_before_end = json_response["labels"].all? { |label_date| Date.parse(label_date) <= Date.parse(end_date) }
    assert all_dates_before_end, "Not all dates in chart_data output are on or before the end_date"
    assert_equal 3, json_response["labels"].count
  end

  test "chart_data should filter by start_date and end_date" do
    start_date = Date.today.to_s
    end_date = Date.today.to_s # Only today
    get shelf_daily_stats_chart_data_url, params: { start_date: start_date, end_date: end_date }
    json_response = JSON.parse(@response.body)

    assert_response :success
    # Expected: stat_two_product_one_today, stat_four_product_two_today, stat_for_filter_product_today
    all_dates_are_today = json_response["labels"].all? { |label_date| Date.parse(label_date) == Date.parse(start_date) }
    assert all_dates_are_today, "Not all dates are for today"
    assert_equal 3, json_response["labels"].count
  end

  test "chart_data should filter by product_id, start_date, and end_date" do
    product_to_filter = products(:product_for_filtering)
    start_date = Date.today.to_s
    end_date = Date.today.to_s # Only today for this specific product
    get shelf_daily_stats_chart_data_url, params: { product_id: product_to_filter.id, start_date: start_date, end_date: end_date }
    json_response = JSON.parse(@response.body)

    assert_response :success
    # Expected: stat_for_filter_product_today
    assert_equal 1, json_response["labels"].count, "Label count mismatch"
    json_response["datasets"].each do |dataset|
      assert_equal 1, dataset["data"].count, "Dataset data count mismatch for dataset '#{dataset['label']}'"
    end
    assert_equal Date.today.strftime('%Y-%m-%d'), json_response["labels"].first
  end

  test "chart_data should return empty arrays when no records match filters" do
    get shelf_daily_stats_chart_data_url, params: { product_id: 99999 } # Non-existent product ID
    json_response = JSON.parse(@response.body)

    assert_response :success
    assert_empty json_response["labels"]
    json_response["datasets"].each do |dataset|
      assert_empty dataset["data"]
    end
  end

  test "chart_data with start_date after end_date should return empty result" do
    start_date = Date.today.to_s
    end_date = (Date.today - 1.day).to_s
    get shelf_daily_stats_chart_data_url, params: { start_date: start_date, end_date: end_date }
    json_response = JSON.parse(@response.body)

    assert_response :success
    assert_empty json_response["labels"], "Labels should be empty when start_date is after end_date"
    json_response["datasets"].each do |dataset|
      assert_empty dataset["data"], "Dataset data should be empty when start_date is after end_date"
    end
  end

  # Test for invalid date format - assuming controller rescues and returns success (e.g. no filter)
  # or specific error handling. Current controller will raise error.
  # This test might need adjustment based on actual error handling for Date.parse failure.
  # For now, expecting a 500 if not rescued, or success if Date.parse is robust or rescued.
  # The provided controller code would lead to an unhandled ArgumentError.
  # A production app should rescue from ArgumentError from Date.parse.
  # For this test, we'll assume that if it doesn't raise an error that stops the test,
  # it should at least return a valid JSON structure (even if empty or all data).
  test "chart_data handles invalid date format by not crashing (ideally returning 400 or filtering)" do
    get shelf_daily_stats_chart_data_url, params: { start_date: "invalid-date-string" }
    # If Date.parse fails and raises ArgumentError, Rails default is 500.
    # If controller rescues ArgumentError and renders json, response would be :success or :bad_request.
    # Let's assert that it doesn't break the server and returns a JSON response.
    assert_response :success # This assumes some form of error handling or that Date.parse is tolerant.
                            # Without specific error handling for Date.parse, this would be a 500.
                            # To make this pass with current controller, it must be changed to handle ArgumentError.
                            # For now, this test highlights a potential fragility.
                            # A more precise test would be to assert_raises if no rescue_from is present.
                            # Or, if a rescue_from is added, test for the specific error response (e.g. 400).
                            # Given the current controller, this test *should* fail (expect 500).
                            # Let's assume the intention is to make it pass, implying future error handling.
    json_response = JSON.parse(@response.body) # Will fail if response is not JSON
    assert_not_nil json_response["labels"]
    assert_not_nil json_response["datasets"]
  end
end
