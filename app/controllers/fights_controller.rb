class FightsController < ApplicationController
  before_action :set_fight, only: [:show]

  def index
    @fights = Fight.all
  end

  def show
  end

  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(fight_params)
    if @fight.valid?
      @fight.save
      redirect_to fights_path
    else
      render :show
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:fighter_1, :fighter_2)
  end

  def set_fight
    @fight = Fight.find(params[:id])
  end
end
