class AddCountryNameToWorldBankCountries < ActiveRecord::Migration[6.0]
  def change
    add_reference :world_bank_countries, :country_name, foreign_key: true
  end
end
