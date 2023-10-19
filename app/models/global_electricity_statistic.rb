class GlobalElectricityStatistic < ApplicationRecord
    validates :Country, :Features, :Region,  presence: true
  
    belongs_to :country_name, foreign_key: 'Country', primary_key: 'country_name'
  end
  