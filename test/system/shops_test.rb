require "application_system_test_case"

class ShopsTest < ApplicationSystemTestCase
  setup do
    @shop = shops(:one)
  end

  test "visiting the index" do
    visit shops_url
    assert_selector "h1", text: "Shops"
  end

  test "should create shop" do
    visit shops_url
    click_on "New shop"

    fill_in "Address", with: @shop.address
    fill_in "City", with: @shop.city_id
    fill_in "Close at", with: @shop.close_at
    fill_in "Comment", with: @shop.comment
    fill_in "Commercial network", with: @shop.commercial_network
    fill_in "Company", with: @shop.company_id
    fill_in "Contact name", with: @shop.contact_name
    fill_in "Contact number", with: @shop.contact_number
    fill_in "Open at", with: @shop.open_at
    click_on "Create Shop"

    assert_text "Shop was successfully created"
    click_on "Back"
  end

  test "should update Shop" do
    visit shop_url(@shop)
    click_on "Edit this shop", match: :first

    fill_in "Address", with: @shop.address
    fill_in "City", with: @shop.city_id
    fill_in "Close at", with: @shop.close_at.to_s
    fill_in "Comment", with: @shop.comment
    fill_in "Commercial network", with: @shop.commercial_network
    fill_in "Company", with: @shop.company_id
    fill_in "Contact name", with: @shop.contact_name
    fill_in "Contact number", with: @shop.contact_number
    fill_in "Open at", with: @shop.open_at.to_s
    click_on "Update Shop"

    assert_text "Shop was successfully updated"
    click_on "Back"
  end

  test "should destroy Shop" do
    visit shop_url(@shop)
    click_on "Destroy this shop", match: :first

    assert_text "Shop was successfully destroyed"
  end
end
