class WorldBankCountry < ApplicationRecord
    validates :Country_Name, :Country_Code, :Year, presence: true
  
    belongs_to :country_name, foreign_key: 'Country_Code', primary_key: 'country_code'
  end
  