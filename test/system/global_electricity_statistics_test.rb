require "application_system_test_case"

class GlobalElectricityStatisticsTest < ApplicationSystemTestCase
  setup do
    @global_electricity_statistic = global_electricity_statistics(:one)
  end

  test "visiting the index" do
    visit global_electricity_statistics_url
    assert_selector "h1", text: "Global electricity statistics"
  end

  test "should create global electricity statistic" do
    visit global_electricity_statistics_url
    click_on "New global electricity statistic"

    fill_in "...", with: @global_electricity_statistic....
    fill_in "1980", with: @global_electricity_statistic.1980
    fill_in "1981", with: @global_electricity_statistic.1981
    fill_in "1982", with: @global_electricity_statistic.1982
    fill_in "1983", with: @global_electricity_statistic.1983
    fill_in "2021", with: @global_electricity_statistic.2021
    fill_in "Country", with: @global_electricity_statistic.Country
    fill_in "Features", with: @global_electricity_statistic.Features
    fill_in "Region", with: @global_electricity_statistic.Region
    click_on "Create Global electricity statistic"

    assert_text "Global electricity statistic was successfully created"
    click_on "Back"
  end

  test "should update Global electricity statistic" do
    visit global_electricity_statistic_url(@global_electricity_statistic)
    click_on "Edit this global electricity statistic", match: :first

    fill_in "...", with: @global_electricity_statistic....
    fill_in "1980", with: @global_electricity_statistic.1980
    fill_in "1981", with: @global_electricity_statistic.1981
    fill_in "1982", with: @global_electricity_statistic.1982
    fill_in "1983", with: @global_electricity_statistic.1983
    fill_in "2021", with: @global_electricity_statistic.2021
    fill_in "Country", with: @global_electricity_statistic.Country
    fill_in "Features", with: @global_electricity_statistic.Features
    fill_in "Region", with: @global_electricity_statistic.Region
    click_on "Update Global electricity statistic"

    assert_text "Global electricity statistic was successfully updated"
    click_on "Back"
  end

  test "should destroy Global electricity statistic" do
    visit global_electricity_statistic_url(@global_electricity_statistic)
    click_on "Destroy this global electricity statistic", match: :first

    assert_text "Global electricity statistic was successfully destroyed"
  end
end
