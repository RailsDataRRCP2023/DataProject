# db/seeds.rb

require 'csv'
require 'json'

# AIMLsalaries Dataset
CSV.foreach(Rails.root.join('lib/seeds/aiml_salaries.csv'), headers: true) do |row|
  AimlSalary.create! row.to_hash
end

# Global Electricity Statistics Dataset
CSV.foreach(Rails.root.join('lib/seeds/global_electricity_statistics.csv'), headers: true) do |row|
  GlobalElectricityStatistic.create! row.to_hash
end

# WorldBankCountries Dataset
CSV.foreach(Rails.root.join('lib/seeds/world_bank_countries.csv'), headers: true) do |row|
  WorldBankCountry.create! row.to_hash
end

# Countries Names Dataset
countries_names_json = File.read(Rails.root.join('lib/seeds/countries_names.json'))
countries_names_hash = JSON.parse(countries_names_json)
countries_names_hash.each do |code, name|
  CountryName.create!(country_code: code, country_name: name)
end
