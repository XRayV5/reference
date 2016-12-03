class CountriesController < ApplicationController

  def shipping_rates
    @country = Country.find_by_code(shipping_rates_params[:country_code])
    # What's the difference from params[:country_code]

    respond_to do |format|
      format.json do
        render :json => {
          :regular => @country.regular_shipping_rate,
          :express => @country.express_shipping_rate
        }
      end
      # format.html
    end

  end

  #why use response_to why not @country.each do |country| ...
  def index
    @countries = Country.all
    #binding.pry
    render :json => @countries
  end

  def country_first
    # TODO: check permit usage
    render json: Country.find(params["id"].to_i)
  end

  def show_by_code
    render json: Country.find_by_code(country_code_params[:country_code])
  end

  def update
    # render json: Country.find(country_id_params["id"])
    # binding.pry
    @updated_country = Country.find(country_id_params[:id])
    @updated_country.regular_shipping_rate = country_id_params[:regular_shipping_rate].to_i
    @updated_country.express_shipping_rate = country_id_params[:express_shipping_rate].to_i
    render json: @updated_country.save
  end

  def create
    @new_country = Country.insert(country_create_params)
    # binding.pry

    # binding.pry
    respond_to do |format|
      format.json do
        render :json => {
          :name => @new_country.name,
          :code => @new_country.code,
          :regular => @new_country.regular_shipping_rate,
          :express => @new_country.express_shipping_rate
        }
      end
      format.html {}
    end
    # render json: @new_country
  end


private

  def shipping_rates_params
    params.permit(:country_code)
  end

  def country_code_params
    params.permit(:country_code)
  end

  def country_id_params
    params.permit(:id, :regular_shipping_rate, :express_shipping_rate)
  end

  def country_create_params
    params.permit(:name, :code, :regular_shipping_rate, :express_shipping_rate)
  end

end
