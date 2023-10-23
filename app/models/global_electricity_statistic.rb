class GlobalElectricityStatistic < ApplicationRecord
    validates :Features, presence: true
    belongs_to :country_name, foreign_key: :country_name_id
  end
  