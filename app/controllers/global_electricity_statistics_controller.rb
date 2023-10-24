class GlobalElectricityStatisticsController < ApplicationController
  before_action :set_global_electricity_statistic, only: %i[ show edit update destroy ]

  # GET /global_electricity_statistics or /global_electricity_statistics.json
  def index
    @page = (params[:page].to_i if params[:page] && params[:page].to_i > 0 || 1) + 1
    @global_electricity_statistics = GlobalElectricityStatistic.limit(100).offset((@page - 1 ) * 100).all

    # Add Top 10 global electricity statistics (joined by country_name_id)
    aiml_salaries_query = <<-SQL
    SELECT sal.*, c.country_name as country_name
    FROM aiml_salaries sal
    JOIN country_names c ON sal.country_name_id = c.id
    ORDER BY sal.job_title DESC 
    LIMIT 2
    SQL

    @salaries = []

    @global_electricity_statistics.each { |stat|
      salary = ActiveRecord::Base.connection.execute(aiml_salaries_query)
      salary.each { |sal| 
        sal["job_title_id"] = stat["id"]
      }
    
      @salaries << salary
    }

    @pages = GlobalElectricityStatistic.count / 100
  end

  # GET /global_electricity_statistics/1 or /global_electricity_statistics/1.json
  def show
  end

  # GET /global_electricity_statistics/new
  def new
    @global_electricity_statistic = GlobalElectricityStatistic.new
  end

  # GET /global_electricity_statistics/1/edit
  def edit
  end

  # POST /global_electricity_statistics or /global_electricity_statistics.json
  def create
    @global_electricity_statistic = GlobalElectricityStatistic.new(global_electricity_statistic_params)

    respond_to do |format|
      if @global_electricity_statistic.save
        format.html { redirect_to global_electricity_statistic_url(@global_electricity_statistic), notice: "Global electricity statistic was successfully created." }
        format.json { render :show, status: :created, location: @global_electricity_statistic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @global_electricity_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /global_electricity_statistics/1 or /global_electricity_statistics/1.json
  def update
    respond_to do |format|
      if @global_electricity_statistic.update(global_electricity_statistic_params)
        format.html { redirect_to global_electricity_statistic_url(@global_electricity_statistic), notice: "Global electricity statistic was successfully updated." }
        format.json { render :show, status: :ok, location: @global_electricity_statistic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @global_electricity_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /global_electricity_statistics/1 or /global_electricity_statistics/1.json
  def destroy
    @global_electricity_statistic.destroy

    respond_to do |format|
      format.html { redirect_to global_electricity_statistics_url, notice: "Global electricity statistic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_global_electricity_statistic
      @global_electricity_statistic = GlobalElectricityStatistic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def global_electricity_statistic_params
      params.require(:global_electricity_statistic).permit(:features, :_1980, :_1981, :_1982, :_1983, :_1984, :_1985, :_1986, :_1987, :_1988, :_1989, :_1990, :_1991, :_1992, :_1993, :_1994, :_1995, :_1996, :_1997, :_1998, :_1999, :_2000, :_2001, :_2002, :_2003, :_2004, :_2005, :_2006, :_2007, :_2008, :_2009, :_2010, :_2011, :_2012, :_2013, :_2014, :_2015, :_2016, :_2017, :_2018, :_2019, :_2020, :_2021, :country_name_id)
    end
end
