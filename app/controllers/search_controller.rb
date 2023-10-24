class SearchController < ApplicationController
    def index
        # Only search if query present
        if params[:query].present? then
            # Get list of countries that match query
            countries_names = CountryName.where("country_name LIKE ?", "%#{params[:query]}%").all
            country_ids = countries_names.map { |country_name| country_name.id }

            # Search for countries
            get_countries = params[:filter].nil? || params[:filter] == "countries" || params[:filter] == "all"
            @worlds = WorldBankCountry.where("country_name_id IN (?)", country_ids).all

            # Search for salaries
            get_salaries = params[:filter].nil? || params[:filter] == "salaries" || params[:filter] == "all"
            @salaries = AimlSalary.where("job_title LIKE ?", "%#{params[:query]}%").all

            # Search for electricity
            get_electricity = params[:filter].nil? || params[:filter] == "electricity" || params[:filter] == "all"
            @electricities = GlobalElectricityStatistic.where("country_name_id IN (?)", country_ids).all
        end
    end
end
