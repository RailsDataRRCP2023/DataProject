class CreateWorldBankCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :world_bank_countries do |t|
      t.string :country_name, null: false
      t.string :country_code, null: false
      t.integer :year, null: false
      t.decimal :agriculture
      t.decimal :ease_of_doing_business
      t.decimal :education_expenditure
      t.decimal :export
      t.decimal :gdp
      t.decimal :health_expenditure
      t.decimal :import
      t.decimal :industry
      t.decimal :inflation_rate
      t.decimal :rnd
      t.decimal :service
      t.decimal :unemployment
      t.integer :population
      t.decimal :land
      t.string :continent_name
      t.references :country_name, foreign_key: { to_table: :country_names }  # Assuming a foreign key to CountryName model

      t.timestamps
    end
    add_index :world_bank_countries, :country_code, unique: true
  end
end
