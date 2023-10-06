class GlobalElectricityStatisticsController < ApplicationController
  before_action :set_global_electricity_statistic, only: %i[ show edit update destroy ]

  # GET /global_electricity_statistics or /global_electricity_statistics.json
  def index
    @global_electricity_statistics = GlobalElectricityStatistic.all
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
      params.require(:global_electricity_statistic).permit(:Country, :Features, :Region, :1980, :1981, :1982, :1983, :..., :2021)
    end
end
