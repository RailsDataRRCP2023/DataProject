class CreateGlobalElectricityStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :global_electricity_statistics do |t|
      t.string :Country
      t.string :Features
      t.string :Region
      t.decimal :1980
      t.decimal :1981
      t.decimal :1982
      t.decimal :1983
      t.string :...
      t.decimal :2021

      t.timestamps
    end
  end
end
