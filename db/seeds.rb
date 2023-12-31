# db/seeds.rb

require 'csv'
require 'json'

# Clear all tables
pp 'Clear all tables'
AimlSalary.destroy_all
GlobalElectricityStatistic.destroy_all
WorldBankCountry.destroy_all
CountryName.destroy_all

# Countries Names Dataset
pp 'Countries Names Dataset'
countries_names_json = File.read('db/Countries_Names.json')
countries_names_hash = JSON.parse(countries_names_json)
countries_names_hash.each do |code, name|
    begin
        CountryName.create!(country_code: code, country_name: name)
    rescue => exception
        pp 'Countries Names Dataset: ' + exception.to_s
    end
end

# AIMLsalaries Dataset
pp 'AIMLsalaries Dataset'
CSV.foreach('db/aiml_salaries.csv', headers: true) do |row|
    begin
        record = row.to_hash
        record['country_name_id'] = CountryName.find_by(country_code: record['company_location']).id
        AimlSalary.create! record.select { |k, _| AimlSalary.column_names.include?(k) }.to_hash
    rescue => exception
        pp 'AIMLsalaries Dataset: ' + exception.to_s
    end
end

# Global Electricity Statistics Dataset
pp 'Global Electricity Statistics Dataset'
CSV.foreach('db/global_electricity_statistics.csv', headers: true) do |row|
    begin
        record = row.to_hash
        record["country_name_id"] = CountryName.find_by(country_code: "US").id
        GlobalElectricityStatistic.create! record.select { |k, _| GlobalElectricityStatistic.column_names.include?(k) }.to_hash
    rescue => exception
        pp 'Global Electricity Statistics Dataset: ' + exception.to_s
    end
end

# WorldBankCountries Dataset
pp 'WorldBankCountries Dataset'
CSV.foreach('db/world_bank_countries.csv', headers: true) do |row|
    begin
        record = row.to_hash
        record['country_name_id'] = CountryName.find_by(country_code: 'US').id
        WorldBankCountry.create! record.select { |k, _| WorldBankCountry.column_names.include?(k) }.to_hash
    rescue => exception
        pp 'WorldBankCountries Dataset: ' + exception.to_s
    end
end


