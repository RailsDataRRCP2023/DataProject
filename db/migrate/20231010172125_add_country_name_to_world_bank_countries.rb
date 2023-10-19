class AddCountryNameToWorldBankCountries < ActiveRecord::Migration[6.0]
  def change
    add_reference :aiml_salaries, :country_name, foreign_key: { to_table: :country_names }
  end
end
