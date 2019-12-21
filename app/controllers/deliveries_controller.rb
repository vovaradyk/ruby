class DeliveriesController < ApplicationController
  before_action :require_login, except: [:index]

  def index
  end

  def new
    @delivery = Delivery.new
  end

  def edit

    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])

    if(@delivery.update(team_params))
      redirect_to Delivery
    else
      render 'edit'
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])

    @delivery.destroy

    redirect_to Delivery
  end


  def create
    @delivery = Delivery.new(delivery_params)

    if(@delivery.save)
      redirect_to Delivery
    else
      render 'new'
    end
  end

  private def delivery_params
    params.require(:delivery).permit(:date, :name, :city_id, :company_id, :price)
  end
end
