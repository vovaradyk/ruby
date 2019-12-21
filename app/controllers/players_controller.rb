class PlayersController < ApplicationController
  before_action :require_login, except: [:index]

  def index
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if(@player.update(player_params))
      redirect_to Player
    else
      render 'edit'
    end
  end

  def create
    @player = Player.new(player_params)

    if(@player.save)
      redirect_to Player
    else
      render 'new'
    end
  end

  def destroy
    @player = Player.find(params[:id])

    @player.destroy

    redirect_to Player
  end

  private def player_params
    params.require(:player).permit(:name, :team_id, :position, :nation, :height, :weight, :birthday)
  end
end
