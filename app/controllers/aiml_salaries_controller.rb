class AimlSalariesController < ApplicationController
  before_action :set_aiml_salary, only: %i[ show edit update destroy ]

  # GET /aiml_salaries or /aiml_salaries.json
  def index
    @page = (params[:page].to_i if params[:page] && params[:page].to_i > 0 || 1) + 1

    @aiml_salaries = AimlSalary.limit(100).offset((@page - 1 ) * 100).all
    # Add Top 10 global electricity statistics (joined by country_name_id)
    electricity_stats_query = <<-SQL
      SELECT es.*, c.country_name as country_name
      FROM global_electricity_statistics es
      JOIN country_names c ON es.country_name_id = c.id
      ORDER BY es.Features DESC 
      LIMIT 2
    SQL

    @electricities = []

    @aiml_salaries.each { |salary|
      electricity = ActiveRecord::Base.connection.execute(electricity_stats_query)
      electricity.each { |elec| 
        elec["salary_id"] = salary["id"]
      }
     
      @electricities << electricity
    }



    @pages = AimlSalary.count / 100
  end

  # GET /aiml_salaries/1 or /aiml_salaries/1.json
  def show
    electricity_stats_query = <<-SQL
      SELECT es.*, c.country_name as country_name
      FROM global_electricity_statistics es
      JOIN country_names c ON es.country_name_id = c.id
      ORDER BY es.Features DESC 
      LIMIT 2
    SQL

    @electricities = []

    salary = AimlSalary.find(params[:id])
      electricity = ActiveRecord::Base.connection.execute(electricity_stats_query)
      electricity.each { |elec| 
        elec["salary_id"] = salary["id"]
      }
     
      @electricities << electricity
    
  end
  

  # GET /aiml_salaries/new
  def new
    @aiml_salary = AimlSalary.new
  end

  # GET /aiml_salaries/1/edit
  def edit
  end

  # POST /aiml_salaries or /aiml_salaries.json
  def create
    @aiml_salary = AimlSalary.new(aiml_salary_params)

    respond_to do |format|
      if @aiml_salary.save
        format.html { redirect_to aiml_salary_url(@aiml_salary), notice: "Aiml salary was successfully created." }
        format.json { render :show, status: :created, location: @aiml_salary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aiml_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aiml_salaries/1 or /aiml_salaries/1.json
  def update
    respond_to do |format|
      if @aiml_salary.update(aiml_salary_params)
        format.html { redirect_to aiml_salary_url(@aiml_salary), notice: "Aiml salary was successfully updated." }
        format.json { render :show, status: :ok, location: @aiml_salary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aiml_salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aiml_salaries/1 or /aiml_salaries/1.json
  def destroy
    @aiml_salary.destroy

    respond_to do |format|
      format.html { redirect_to aiml_salaries_url, notice: "Aiml salary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aiml_salary
      @aiml_salary = AimlSalary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aiml_salary_params
      params.require(:aiml_salary).permit(:work_year, :experience_level, :employment_type, :job_title, :salary, :salary_currency, :salary_in_usd, :remote_ratio, :company_size, :country_name_id)
    end
end
