require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "should create company" do
    visit companies_url
    click_on "New company"

    fill_in "Capacity red", with: @company.capacity_red
    fill_in "Capacity yellow", with: @company.capacity_yellow
    fill_in "Name", with: @company.name
    fill_in "Notification period red", with: @company.notification_period_red
    fill_in "Notification period temperature", with: @company.notification_period_temperature
    fill_in "Notification period yellow", with: @company.notification_period_yellow
    fill_in "Notification period zen", with: @company.notification_period_zen
    fill_in "Shelf offline timeout", with: @company.shelf_offline_timeout
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "should update Company" do
    visit company_url(@company)
    click_on "Edit this company", match: :first

    fill_in "Capacity red", with: @company.capacity_red
    fill_in "Capacity yellow", with: @company.capacity_yellow
    fill_in "Name", with: @company.name
    fill_in "Notification period red", with: @company.notification_period_red
    fill_in "Notification period temperature", with: @company.notification_period_temperature
    fill_in "Notification period yellow", with: @company.notification_period_yellow
    fill_in "Notification period zen", with: @company.notification_period_zen
    fill_in "Shelf offline timeout", with: @company.shelf_offline_timeout
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "should destroy Company" do
    visit company_url(@company)
    click_on "Destroy this company", match: :first

    assert_text "Company was successfully destroyed"
  end
end
