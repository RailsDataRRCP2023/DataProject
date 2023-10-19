class AimlSalary < ApplicationRecord
    validates :work_year, :country_name_id, :experience_level, :employment_type, :job_title, :salary, :salary_currency, :salary_in_usd, :employee_residence, :remote_ratio, :company_location, :company_size, presence: true
  end