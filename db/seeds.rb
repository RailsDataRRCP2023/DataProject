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
# pp 'Countries Names Dataset'
# countries_names_json = File.read('db/Countries_Names.json')
# countries_names_hash = JSON.parse(countries_names_json)
# countries_names_hash.each do |code, name|
#   cleaned_code = code.strip.gsub(/[^0-9a-zA-Z\s]/, '')
#   cleaned_name = name.strip.gsub(/[^0-9a-zA-Z\s]/, '')
#   CountryName.create!(country_code: cleaned_code, country_name: cleaned_name)
# rescue StandardError => e
#   pp 'Countries Names Dataset: ' + e.to_s
# end

pp 'Populate CountryName records'
CSV.foreach('db/world_bank_countries.csv', headers: true) do |row|
  record = row.to_hash

  cleaned_record = {}
  record.each do |key, value|
    cleaned_key = key.strip.gsub(/[^0-9a-zA-Z\s]/, '')
    cleaned_value = value&.strip&.gsub(/[^0-9a-zA-Z\s]/, '')

    cleaned_record[cleaned_key] = cleaned_value
  end

  record = cleaned_record
  cleaned_country_code = record['Country Code']
  cleaned_country_name = record['Country Name']

  CountryName.find_or_create_by(country_code: cleaned_country_code, country_name: cleaned_country_name)
end

# AIMLsalaries Dataset
pp 'AIMLsalaries Dataset'
CSV.foreach('db/aiml_salaries.csv', headers: true) do |row|
  record = row.to_hash
  company_record = CountryName.find_by(country_code: record['company_location'])
  if company_record
    record['country_name_id'] = company_record.id
    AimlSalary.create! record.select { |k, _| AimlSalary.column_names.include?(k) }.to_hash
  end
rescue StandardError => e
  pp 'AIMLsalaries Dataset: ' + e.to_s
end

# Global Electricity Statistics Dataset
pp 'Global Electricity Statistics Dataset'
CSV.foreach('db/global_electricity_statistics.csv', headers: true) do |row|
  record = row.to_hash
  cleaned_record = {}

  record.each do |key, value|
    cleaned_key = key.strip.gsub(/[^0-9a-zA-Z\s]/, '')
    cleaned_value = value&.strip&.gsub(/[^0-9a-zA-Z\s]/, '')

    cleaned_record[cleaned_key] = cleaned_value
  end
  record = cleaned_record

  country_name_record = CountryName.find_by(country_name: cleaned_record['Country'])
  if country_name_record
    record['country_name_id'] = country_name_record.id

    GlobalElectricityStatistic.create! record.select { |k, _|
      GlobalElectricityStatistic.column_names.include?(k)
    }.to_hash
  end
rescue StandardError => e
  pp 'Global Electricity Statistics Dataset: ' + e.to_s
end

# WorldBankCountries Dataset
pp 'WorldBankCountries Dataset'
CSV.foreach('db/world_bank_countries.csv', headers: true) do |row|
  record = row.to_hash
  cleaned_record = {}

  record.each do |key, value|
    cleaned_key = key.strip.gsub(/[^0-9a-zA-Z\s]/, '')
    cleaned_value = value&.strip&.gsub(/[^0-9a-zA-Z\s]/, '')

    cleaned_record[cleaned_key] = cleaned_value
  end

  record['country_name_id'] = CountryName.find_by(country_code: cleaned_record['Country Code']).id
  WorldBankCountry.create! record.select { |k, _| WorldBankCountry.column_names.include?(k) }.to_hash
rescue StandardError => e
  pp 'WorldBankCountries Dataset: ' + e.to_s
end
