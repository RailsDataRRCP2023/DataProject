# db/seeds.rb

require 'csv'
require 'json'

# Countries Names Dataset
pp 'Countries Names Dataset'
countries_names_json = File.read('db/Countries_Names.json')
countries_names_hash = JSON.parse(countries_names_json)
countries_names_hash.each do |code, name|
    begin
        CountryName.create!(country_code: code, country_name: name)
    rescue => exception
        pp exception
    end
end

# Clear all tables
pp 'Clear all tables'
AimlSalary.destroy_all
GlobalElectricityStatistic.destroy_all
WorldBankCountry.destroy_all
CountryName.destroy_all

# AIMLsalaries Dataset
pp 'AIMLsalaries Dataset'
CSV.foreach('db/aiml_salaries.csv', headers: true) do |row|
    begin
        AimlSalary.create! row.to_hash.select { |k, _| AimlSalary.column_names.include?(k) }.to_hash
    rescue => exception
        pp exception
    end
end

# Global Electricity Statistics Dataset
pp 'Global Electricity Statistics Dataset'
CSV.foreach('db/global_electricity_statistics.csv', headers: true) do |row|
    begin
        GlobalElectricityStatistic.create! row.to_hash.select { |k, _| GlobalElectricityStatistic.column_names.include?(k) }.to_hash
    rescue => exception
        pp exception        
    end
end

# WorldBankCountries Dataset
pp 'WorldBankCountries Dataset'
CSV.foreach('db/world_bank_countries.csv', headers: true) do |row|
    begin
        WorldBankCountry.create! row.to_hash.select { |k, _| WorldBankCountry.column_names.include?(k) }.to_hash
    rescue => exception
        pp exception
    end
end


