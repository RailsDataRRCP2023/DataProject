require "test_helper"

class WorldBankCountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @world_bank_country = world_bank_countries(:one)
  end

  test "should get index" do
    get world_bank_countries_url
    assert_response :success
  end

  test "should get new" do
    get new_world_bank_country_url
    assert_response :success
  end

  test "should create world_bank_country" do
    assert_difference("WorldBankCountry.count") do
      post world_bank_countries_url, params: { world_bank_country: { Agriculture: @world_bank_country.Agriculture, Country_Code: @world_bank_country.Country_Code, Country_Name: @world_bank_country.Country_Name, Ease_of_Doing_Business: @world_bank_country.Ease_of_Doing_Business, Education_Expenditure: @world_bank_country.Education_Expenditure, Export: @world_bank_country.Export, GDP: @world_bank_country.GDP, Health_Expenditure: @world_bank_country.Health_Expenditure, Import: @world_bank_country.Import, Industry: @world_bank_country.Industry, Inflation_Rate: @world_bank_country.Inflation_Rate, R: @world_bank_country.R, Year: @world_bank_country.Year } }
    end

    assert_redirected_to world_bank_country_url(WorldBankCountry.last)
  end

  test "should show world_bank_country" do
    get world_bank_country_url(@world_bank_country)
    assert_response :success
  end

  test "should get edit" do
    get edit_world_bank_country_url(@world_bank_country)
    assert_response :success
  end

  test "should update world_bank_country" do
    patch world_bank_country_url(@world_bank_country), params: { world_bank_country: { Agriculture: @world_bank_country.Agriculture, Country_Code: @world_bank_country.Country_Code, Country_Name: @world_bank_country.Country_Name, Ease_of_Doing_Business: @world_bank_country.Ease_of_Doing_Business, Education_Expenditure: @world_bank_country.Education_Expenditure, Export: @world_bank_country.Export, GDP: @world_bank_country.GDP, Health_Expenditure: @world_bank_country.Health_Expenditure, Import: @world_bank_country.Import, Industry: @world_bank_country.Industry, Inflation_Rate: @world_bank_country.Inflation_Rate, R: @world_bank_country.R, Year: @world_bank_country.Year } }
    assert_redirected_to world_bank_country_url(@world_bank_country)
  end

  test "should destroy world_bank_country" do
    assert_difference("WorldBankCountry.count", -1) do
      delete world_bank_country_url(@world_bank_country)
    end

    assert_redirected_to world_bank_countries_url
  end
end
