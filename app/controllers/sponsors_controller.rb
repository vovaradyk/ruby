class SponsorsController < ApplicationController
  before_action :require_login, except: [:index]

  def index
  end

  def new
    @sponsor = Sponsor.new
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def update
    @sponsor = Sponsor.find(params[:id])

    if(@sponsor.update(sponsor_params))
      redirect_to Sponsor
    else
      render 'edit'
    end
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)

    if(@sponsor.save)
      redirect_to Sponsor
    else
      render 'new'
    end
  end

  def destroy
    @sponsor = Sponsor.find(params[:id])

    @sponsor.destroy

    redirect_to Sponsor
  end

  private def sponsor_params
    params.require(:sponsor).permit(:name, :address, :payment, :phone)
  end
end
