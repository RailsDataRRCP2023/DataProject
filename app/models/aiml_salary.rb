class AimlSalary < ApplicationRecord
    validates :work_year, :experience_level, :employment_type, :job_title, :salary, :salary_currency, :salary_in_usd, :employee_residence, :remote_ratio, :company_location, :company_size, presence: true
    
    belongs_to :country_name, foreign_key: 'company_location', primary_key: 'country_name'
  end
