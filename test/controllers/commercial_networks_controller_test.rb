require "test_helper"

class CommercialNetworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commercial_network = commercial_networks(:one)
  end

  test "should get index" do
    get commercial_networks_url
    assert_response :success
  end

  test "should get new" do
    get new_commercial_network_url
    assert_response :success
  end

  test "should create commercial_network" do
    assert_difference("CommercialNetwork.count") do
      post commercial_networks_url, params: { commercial_network: {} }
    end

    assert_redirected_to commercial_network_url(CommercialNetwork.last)
  end

  test "should show commercial_network" do
    get commercial_network_url(@commercial_network)
    assert_response :success
  end

  test "should get edit" do
    get edit_commercial_network_url(@commercial_network)
    assert_response :success
  end

  test "should update commercial_network" do
    patch commercial_network_url(@commercial_network), params: { commercial_network: {} }
    assert_redirected_to commercial_network_url(@commercial_network)
  end

  test "should destroy commercial_network" do
    assert_difference("CommercialNetwork.count", -1) do
      delete commercial_network_url(@commercial_network)
    end

    assert_redirected_to commercial_networks_url
  end
end
