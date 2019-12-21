class CompaniesController < ApplicationController
  def index
  end

  def new
    @company = Company.new
  end

  def edit

    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if(@company.update(team_params))
      redirect_to Company
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])

    @company.destroy

    redirect_to Company
  end


  def create
    @company = Company.new(company_params)

    if(@company.save)
      redirect_to Company
    else
      render 'new'
    end
  end

  private def company_params
    params.require(:company).permit(:name, :city_id, :address, :year, :phone)
  end
end
