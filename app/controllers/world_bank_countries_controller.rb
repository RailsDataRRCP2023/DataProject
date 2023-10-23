class WorldBankCountriesController < ApplicationController
  before_action :set_world_bank_country, only: %i[ show edit update destroy ]

  # GET /world_bank_countries or /world_bank_countries.json
  def index
    @page = (params[:page].to_i if params[:page] && params[:page].to_i > 0 || 1) + 1
    @world_bank_countries = WorldBankCountry.limit(100).all
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
