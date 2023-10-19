class GlobalElectricityStatistic < ApplicationRecord
    validates :Country, :Features, :Region, :country_name_id, presence: true
  end