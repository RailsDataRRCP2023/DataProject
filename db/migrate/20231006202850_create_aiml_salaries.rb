class CreateAimlSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :aiml_salaries do |t|
      t.integer :work_year
      t.string :experience_level
      t.string :employment_type
      t.string :job_title
      t.decimal :salary
      t.string :salary_currency
      t.decimal :salary_in_usd
      t.integer :remote_ratio
      t.string :company_size
      t.references :country_name, null: false, foreign_key: true

      t.timestamps
    end
  end
end
