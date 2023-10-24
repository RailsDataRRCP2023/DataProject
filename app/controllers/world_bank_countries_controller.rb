class WorldBankCountriesController < ApplicationController
  before_action :set_world_bank_country, only: [:show, :edit, :update, :destroy], except: [:top_gdp]

  # GET /world_bank_countries or /world_bank_countries.json
  def index
    @page = (params[:page].to_i if params[:page] && params[:page].to_i > 0 || 1) + 1
    @world_bank_countries = WorldBankCountry.limit(100).offset((@page - 1 ) * 100).all

    # Add Top 10 global electricity statistics (joined by country_name_id)
    aiml_salaries_query = <<-SQL
    SELECT sal.*, c.country_name as country_name
    FROM aiml_salaries sal
    JOIN country_names c ON sal.country_name_id = c.id
    ORDER BY sal.job_title DESC 
    LIMIT 2
    SQL

    @countries = []

    @world_bank_countries.each { |wbc|
      wb = ActiveRecord::Base.connection.execute(aiml_salaries_query)
      wb.each { |country| 
        country["Year_id"] = wbc["id"]
      }
    
      @countries << wb
    }

    @pages = WorldBankCountry.count / 100
  end

  # GET /world_bank_countries/1 or /world_bank_countries/1.json
  def show
  end

  # GET /world_bank_countries/new
  def new
    @world_bank_country = WorldBankCountry.new
  end

  # GET /world_bank_countries/1/edit
  def edit
  end

  # POST /world_bank_countries or /world_bank_countries.json
  def create
    @world_bank_country = WorldBankCountry.new(world_bank_country_params)

    respond_to do |format|
      if @world_bank_country.save
        format.html { redirect_to world_bank_country_url(@world_bank_country), notice: "World bank country was successfully created." }
        format.json { render :show, status: :created, location: @world_bank_country }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @world_bank_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /world_bank_countries/1 or /world_bank_countries/1.json
  def update
    respond_to do |format|
      if @world_bank_country.update(world_bank_country_params)
        format.html { redirect_to world_bank_country_url(@world_bank_country), notice: "World bank country was successfully updated." }
        format.json { render :show, status: :ok, location: @world_bank_country }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @world_bank_country.errors, status: :unprocessable_entity }
      end
    end
  end

  def top_gdp
    @top_countries = WorldBankCountry.order(gdp: :desc).limit(10)
  end

  # DELETE /world_bank_countries/1 or /world_bank_countries/1.json
  def destroy
    @world_bank_country.destroy

    respond_to do |format|
      format.html { redirect_to world_bank_countries_url, notice: "World bank country was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_world_bank_country
    @world_bank_country = WorldBankCountry.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def world_bank_country_params
    params.require(:world_bank_country).permit(:Year, :Agriculture, :Ease_Of_Doing_Business, :Education_Expenditure, :Export, :GDP, :Health_Expenditure, :Import, :Industry, :Inflation_Rate, :R, :country_name_id)
  end
end
