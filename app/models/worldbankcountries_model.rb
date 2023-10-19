class WorldBankCountry < ApplicationRecord
    validates :Country_Name, :Country_Code, :country_name_id, :Year, presence: true
  end