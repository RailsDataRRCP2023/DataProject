class AddCountryNameToGlobalElectricityStatistics < ActiveRecord::Migration[6.0]
  def change
    add_reference :global_electricity_statistics, :country_name, foreign_key: true
  end
end
