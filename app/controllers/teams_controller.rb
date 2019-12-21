class TeamsController < ApplicationController
  #http_basic_authenticate_with name: "admin", password: "1", except: [:index]
  before_action :require_login, except: [:index]

  def index
  end

  def new
    @team = Team.new
  end

  def edit

    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if(@team.update(team_params))
      redirect_to Team
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])

    @team.destroy

    redirect_to Team
  end


  def create
   @team = Team.new(team_params)

    if(@team.save)
      redirect_to Team
    else
      render 'new'
      end
  end

  private def team_params
    params.require(:team).permit(:name, :city_id, :color, :year, :sponsor_id, :budget)
  end
end
