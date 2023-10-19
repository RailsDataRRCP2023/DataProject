class CountryName < ApplicationRecord
    validates :country_code, presence: true, uniqueness: true, length: { is: 2 }
    validates :country_name_id, presence: true, uniqueness: true
  
    has_many :global_electricity_statistics, foreign_key: 'Country', primary_key: 'country_name'
    has_many :world_bank_countries, foreign_key: 'Country_Code', primary_key: 'country_code'
    has_many :aiml_salaries, foreign_key: 'company_location', primary_key: 'country_name'
  end
  