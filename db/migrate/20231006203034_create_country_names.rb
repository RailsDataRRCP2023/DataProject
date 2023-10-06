class CreateCountryNames < ActiveRecord::Migration[7.0]
  def change
    create_table :country_names do |t|
      t.string :country_code
      t.string :country_name

      t.timestamps
    end
  end
end
