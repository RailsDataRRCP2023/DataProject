class AddCountryNameToGlobalElectricityStatistics < ActiveRecord::Migration[7.0]
  def change
    add_reference :global_electricity_statistics, :country_name, foreign_key: { to_table: :country_names }
  end
end
