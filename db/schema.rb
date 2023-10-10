# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_06_203034) do
  create_table "aiml_salaries", force: :cascade do |t|
    t.integer "work_year"
    t.string "experience_level"
    t.string "employment_type"
    t.string "job_title"
    t.decimal "salary"
    t.string "salary_currency"
    t.decimal "salary_in_usd"
    t.string "employee_residence"
    t.integer "remote_ratio"
    t.string "company_location"
    t.string "company_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_names", force: :cascade do |t|
    t.string "country_code"
    t.string "country_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "global_electricity_statistics", force: :cascade do |t|
    t.string "Country"
    t.string "Features"
    t.string "Region"
    t.decimal "_1980"
    t.decimal "_1981"
    t.decimal "_1982"
    t.decimal "_1983"
    t.decimal "_1984"
    t.decimal "_1985"
    t.decimal "_1986"
    t.decimal "_1987"
    t.decimal "_1988"
    t.decimal "_1989"
    t.decimal "_1990"
    t.decimal "_1991"
    t.decimal "_1992"
    t.decimal "_1993"
    t.decimal "_1994"
    t.decimal "_1995"
    t.decimal "_1996"
    t.decimal "_1997"
    t.decimal "_1998"
    t.decimal "_1999"
    t.decimal "_2000"
    t.decimal "_2001"
    t.decimal "_2002"
    t.decimal "_2003"
    t.decimal "_2004"
    t.decimal "_2005"
    t.decimal "_2006"
    t.decimal "_2007"
    t.decimal "_2008"
    t.decimal "_2009"
    t.decimal "_2010"
    t.decimal "_2011"
    t.decimal "_2012"
    t.decimal "_2013"
    t.decimal "_2014"
    t.decimal "_2015"
    t.decimal "_2016"
    t.decimal "_2017"
    t.decimal "_2018"
    t.decimal "_2019"
    t.decimal "_2020"
    t.decimal "_2021"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "world_bank_countries", force: :cascade do |t|
    t.string "Country_Name"
    t.string "Country_Code"
    t.integer "Year"
    t.decimal "Agriculture"
    t.decimal "Ease_of_Doing_Business"
    t.decimal "Education_Expenditure"
    t.decimal "Export"
    t.decimal "GDP"
    t.decimal "Health_Expenditure"
    t.decimal "Import"
    t.decimal "Industry"
    t.decimal "Inflation_Rate"
    t.string "R"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
