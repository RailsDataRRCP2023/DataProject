class CountryName < ApplicationRecord
    validates :country_code, presence: true, uniqueness: true, length: { is: 2 }
  
    has_many :global_electricity_statistics
    has_many :world_bank_countries
  end
  