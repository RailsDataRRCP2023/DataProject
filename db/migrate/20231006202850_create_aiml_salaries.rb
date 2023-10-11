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
      t.string :employee_residence
      t.integer :remote_ratio
      t.string :company_location
      t.string :company_size

      t.timestamps
    end
  end
end