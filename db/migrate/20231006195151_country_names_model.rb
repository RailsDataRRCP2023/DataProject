class CreateCountryNames < ActiveRecord::Migration[7.0]
  def change
    create_table :country_names do |t|
      t.string :country_code, null: false, unique: true, limit: 2
      t.string :country_name, null: false, unique: true

      t.timestamps
    end
    add_index :country_names, :country_code, unique: true
    add_index :country_names, :country_name, unique: true
  end
end
