class GlobalElectricityStatistic < ApplicationRecord
    validates :Country, :Features, :Region, presence: true
  end
  
