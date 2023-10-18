class AddCountryNameToAimlSalaries < ActiveRecord::Migration[7.0]
  def change
    add_reference :aiml_salaries, :country_name, null: false, foreign_key: true
  end
end
