require "test_helper"

class AimlSalariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aiml_salary = aiml_salaries(:one)
  end

  test "should get index" do
    get aiml_salaries_url
    assert_response :success
  end

  test "should get new" do
    get new_aiml_salary_url
    assert_response :success
  end

  test "should create aiml_salary" do
    assert_difference("AimlSalary.count") do
      post aiml_salaries_url, params: { aiml_salary: { company_location: @aiml_salary.company_location, company_size: @aiml_salary.company_size, employee_residence: @aiml_salary.employee_residence, employment_type: @aiml_salary.employment_type, experience_level: @aiml_salary.experience_level, job_title: @aiml_salary.job_title, remote_ratio: @aiml_salary.remote_ratio, salary: @aiml_salary.salary, salary_currency: @aiml_salary.salary_currency, salary_in_usd: @aiml_salary.salary_in_usd, work_year: @aiml_salary.work_year } }
    end

    assert_redirected_to aiml_salary_url(AimlSalary.last)
  end

  test "should show aiml_salary" do
    get aiml_salary_url(@aiml_salary)
    assert_response :success
  end

  test "should get edit" do
    get edit_aiml_salary_url(@aiml_salary)
    assert_response :success
  end

  test "should update aiml_salary" do
    patch aiml_salary_url(@aiml_salary), params: { aiml_salary: { company_location: @aiml_salary.company_location, company_size: @aiml_salary.company_size, employee_residence: @aiml_salary.employee_residence, employment_type: @aiml_salary.employment_type, experience_level: @aiml_salary.experience_level, job_title: @aiml_salary.job_title, remote_ratio: @aiml_salary.remote_ratio, salary: @aiml_salary.salary, salary_currency: @aiml_salary.salary_currency, salary_in_usd: @aiml_salary.salary_in_usd, work_year: @aiml_salary.work_year } }
    assert_redirected_to aiml_salary_url(@aiml_salary)
  end

  test "should destroy aiml_salary" do
    assert_difference("AimlSalary.count", -1) do
      delete aiml_salary_url(@aiml_salary)
    end

    assert_redirected_to aiml_salaries_url
  end
end
