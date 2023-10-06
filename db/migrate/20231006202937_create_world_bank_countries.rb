class CreateWorldBankCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :world_bank_countries do |t|
      t.string :Country_Name
      t.string :Country_Code
      t.integer :Year
      t.decimal :Agriculture
      t.decimal :Ease_of_Doing_Business
      t.decimal :Education_Expenditure
      t.decimal :Export
      t.decimal :GDP
      t.decimal :Health_Expenditure
      t.decimal :Import
      t.decimal :Industry
      t.decimal :Inflation_Rate
      t.string :R

      t.timestamps
    end
  end
end
