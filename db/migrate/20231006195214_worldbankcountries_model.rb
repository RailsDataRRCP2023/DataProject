class CreateWorldBankCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :world_bank_countries do |t|
      t.string :Country_Name, null: false
      t.string :Country_Code, null: false
      t.integer :Year, null: false
      t.decimal :Agriculture
      t.decimal :Ease_of_Doing_Business
      t.decimal :Education_Expenditure
      t.decimal :Export
      t.decimal :GDP
      t.decimal :Health_Expenditure
      t.decimal :Import
      t.decimal :Industry
      t.decimal :Inflation_Rate
      t.decimal :RnD
      t.decimal :Service
      t.decimal :Unemployment
      t.integer :Population
      t.decimal :Land
      t.string :Continent_Name
      t.references :country_name, foreign_key: { to_table: :country_names }  # Assuming a foreign key to CountryName model

      t.timestamps
    end
    add_index :world_bank_countries, :Country_Code, unique: true
  end
end

