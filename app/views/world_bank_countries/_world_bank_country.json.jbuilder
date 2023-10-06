json.extract! world_bank_country, :id, :Country_Name, :Country_Code, :Year, :Agriculture, :Ease_of_Doing_Business, :Education_Expenditure, :Export, :GDP, :Health_Expenditure, :Import, :Industry, :Inflation_Rate, :R, :created_at, :updated_at
json.url world_bank_country_url(world_bank_country, format: :json)
