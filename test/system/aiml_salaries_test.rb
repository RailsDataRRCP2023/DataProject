require "application_system_test_case"

class AimlSalariesTest < ApplicationSystemTestCase
  setup do
    @aiml_salary = aiml_salaries(:one)
  end

  test "visiting the index" do
    visit aiml_salaries_url
    assert_selector "h1", text: "Aiml salaries"
  end

  test "should create aiml salary" do
    visit aiml_salaries_url
    click_on "New aiml salary"

    fill_in "Company location", with: @aiml_salary.company_location
    fill_in "Company size", with: @aiml_salary.company_size
    fill_in "Employee residence", with: @aiml_salary.employee_residence
    fill_in "Employment type", with: @aiml_salary.employment_type
    fill_in "Experience level", with: @aiml_salary.experience_level
    fill_in "Job title", with: @aiml_salary.job_title
    fill_in "Remote ratio", with: @aiml_salary.remote_ratio
    fill_in "Salary", with: @aiml_salary.salary
    fill_in "Salary currency", with: @aiml_salary.salary_currency
    fill_in "Salary in usd", with: @aiml_salary.salary_in_usd
    fill_in "Work year", with: @aiml_salary.work_year
    click_on "Create Aiml salary"

    assert_text "Aiml salary was successfully created"
    click_on "Back"
  end

  test "should update Aiml salary" do
    visit aiml_salary_url(@aiml_salary)
    click_on "Edit this aiml salary", match: :first

    fill_in "Company location", with: @aiml_salary.company_location
    fill_in "Company size", with: @aiml_salary.company_size
    fill_in "Employee residence", with: @aiml_salary.employee_residence
    fill_in "Employment type", with: @aiml_salary.employment_type
    fill_in "Experience level", with: @aiml_salary.experience_level
    fill_in "Job title", with: @aiml_salary.job_title
    fill_in "Remote ratio", with: @aiml_salary.remote_ratio
    fill_in "Salary", with: @aiml_salary.salary
    fill_in "Salary currency", with: @aiml_salary.salary_currency
    fill_in "Salary in usd", with: @aiml_salary.salary_in_usd
    fill_in "Work year", with: @aiml_salary.work_year
    click_on "Update Aiml salary"

    assert_text "Aiml salary was successfully updated"
    click_on "Back"
  end

  test "should destroy Aiml salary" do
    visit aiml_salary_url(@aiml_salary)
    click_on "Destroy this aiml salary", match: :first

    assert_text "Aiml salary was successfully destroyed"
  end
end
