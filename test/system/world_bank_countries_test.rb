require "application_system_test_case"

class WorldBankCountriesTest < ApplicationSystemTestCase
  setup do
    @world_bank_country = world_bank_countries(:one)
  end

  test "visiting the index" do
    visit world_bank_countries_url
    assert_selector "h1", text: "World bank countries"
  end

  test "should create world bank country" do
    visit world_bank_countries_url
    click_on "New world bank country"

    fill_in "Agriculture", with: @world_bank_country.Agriculture
    fill_in "Country code", with: @world_bank_country.Country_Code
    fill_in "Country name", with: @world_bank_country.Country_Name
    fill_in "Ease of doing business", with: @world_bank_country.Ease_of_Doing_Business
    fill_in "Education expenditure", with: @world_bank_country.Education_Expenditure
    fill_in "Export", with: @world_bank_country.Export
    fill_in "Gdp", with: @world_bank_country.GDP
    fill_in "Health expenditure", with: @world_bank_country.Health_Expenditure
    fill_in "Import", with: @world_bank_country.Import
    fill_in "Industry", with: @world_bank_country.Industry
    fill_in "Inflation rate", with: @world_bank_country.Inflation_Rate
    fill_in "R", with: @world_bank_country.R
    fill_in "Year", with: @world_bank_country.Year
    click_on "Create World bank country"

    assert_text "World bank country was successfully created"
    click_on "Back"
  end

  test "should update World bank country" do
    visit world_bank_country_url(@world_bank_country)
    click_on "Edit this world bank country", match: :first

    fill_in "Agriculture", with: @world_bank_country.Agriculture
    fill_in "Country code", with: @world_bank_country.Country_Code
    fill_in "Country name", with: @world_bank_country.Country_Name
    fill_in "Ease of doing business", with: @world_bank_country.Ease_of_Doing_Business
    fill_in "Education expenditure", with: @world_bank_country.Education_Expenditure
    fill_in "Export", with: @world_bank_country.Export
    fill_in "Gdp", with: @world_bank_country.GDP
    fill_in "Health expenditure", with: @world_bank_country.Health_Expenditure
    fill_in "Import", with: @world_bank_country.Import
    fill_in "Industry", with: @world_bank_country.Industry
    fill_in "Inflation rate", with: @world_bank_country.Inflation_Rate
    fill_in "R", with: @world_bank_country.R
    fill_in "Year", with: @world_bank_country.Year
    click_on "Update World bank country"

    assert_text "World bank country was successfully updated"
    click_on "Back"
  end

  test "should destroy World bank country" do
    visit world_bank_country_url(@world_bank_country)
    click_on "Destroy this world bank country", match: :first

    assert_text "World bank country was successfully destroyed"
  end
end
