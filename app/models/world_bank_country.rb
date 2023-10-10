class WorldBankCountry < ApplicationRecord
    validates :Country_Name, :Country_Code, :Year, presence: true
  end
  