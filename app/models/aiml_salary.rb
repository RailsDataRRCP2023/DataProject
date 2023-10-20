class AimlSalary < ApplicationRecord
    validates :work_year, :experience_level, :employment_type, :job_title, :salary, :salary_currency, :salary_in_usd, :remote_ratio, :company_size, presence: true
    
    belongs_to :country_name
  end
