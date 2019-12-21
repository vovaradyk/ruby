class CitiesController < ApplicationController
  before_action :require_login, except: [:index]

  def index
  end

  def new
    @city = City.new
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])

    if(@city.update(city_params))
      redirect_to City
    else
      render 'edit'
    end
  end

  def create
    @city = City.new(city_params)

    if(@city.save)
      redirect_to City
    else
      render 'new'
    end
  end

  def destroy
    @city = City.find(params[:id])

    @city.destroy

    redirect_to City
  end

  private def city_params
    params.require(:city).permit(:name, :state, :country, :timezone, :postcode)
  end
end
