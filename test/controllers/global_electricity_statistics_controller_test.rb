require "test_helper"

class GlobalElectricityStatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @global_electricity_statistic = global_electricity_statistics(:one)
  end

  test "should get index" do
    get global_electricity_statistics_url
    assert_response :success
  end

  test "should get new" do
    get new_global_electricity_statistic_url
    assert_response :success
  end

  test "should create global_electricity_statistic" do
    assert_difference("GlobalElectricityStatistic.count") do
      post global_electricity_statistics_url, params: { global_electricity_statistic: { ...: @global_electricity_statistic...., 1980: @global_electricity_statistic.1980, 1981: @global_electricity_statistic.1981, 1982: @global_electricity_statistic.1982, 1983: @global_electricity_statistic.1983, 2021: @global_electricity_statistic.2021, Country: @global_electricity_statistic.Country, Features: @global_electricity_statistic.Features, Region: @global_electricity_statistic.Region } }
    end

    assert_redirected_to global_electricity_statistic_url(GlobalElectricityStatistic.last)
  end

  test "should show global_electricity_statistic" do
    get global_electricity_statistic_url(@global_electricity_statistic)
    assert_response :success
  end

  test "should get edit" do
    get edit_global_electricity_statistic_url(@global_electricity_statistic)
    assert_response :success
  end

  test "should update global_electricity_statistic" do
    patch global_electricity_statistic_url(@global_electricity_statistic), params: { global_electricity_statistic: { ...: @global_electricity_statistic...., 1980: @global_electricity_statistic.1980, 1981: @global_electricity_statistic.1981, 1982: @global_electricity_statistic.1982, 1983: @global_electricity_statistic.1983, 2021: @global_electricity_statistic.2021, Country: @global_electricity_statistic.Country, Features: @global_electricity_statistic.Features, Region: @global_electricity_statistic.Region } }
    assert_redirected_to global_electricity_statistic_url(@global_electricity_statistic)
  end

  test "should destroy global_electricity_statistic" do
    assert_difference("GlobalElectricityStatistic.count", -1) do
      delete global_electricity_statistic_url(@global_electricity_statistic)
    end

    assert_redirected_to global_electricity_statistics_url
  end
end
