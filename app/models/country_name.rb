class CountryName < ApplicationRecord
    validates :country_code, presence: true, uniqueness: true, length: { is: 2 }
end
