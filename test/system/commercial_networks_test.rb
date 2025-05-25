require "application_system_test_case"

class CommercialNetworksTest < ApplicationSystemTestCase
  setup do
    @commercial_network = commercial_networks(:one)
  end

  test "visiting the index" do
    visit commercial_networks_url
    assert_selector "h1", text: "Commercial networks"
  end

  test "should create commercial network" do
    visit commercial_networks_url
    click_on "New commercial network"

    click_on "Create Commercial network"

    assert_text "Commercial network was successfully created"
    click_on "Back"
  end

  test "should update Commercial network" do
    visit commercial_network_url(@commercial_network)
    click_on "Edit this commercial network", match: :first

    click_on "Update Commercial network"

    assert_text "Commercial network was successfully updated"
    click_on "Back"
  end

  test "should destroy Commercial network" do
    visit commercial_network_url(@commercial_network)
    click_on "Destroy this commercial network", match: :first

    assert_text "Commercial network was successfully destroyed"
  end
end
