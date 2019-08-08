class FightsController < ApplicationController
  before_action :set_fight, only: [:show]
  before_action :set_fighters, only: [:create]

  def index
    @fights = Fight.all
    @best_xp = helpers.best_xp
  end

  def show
    @fighter_1 = Warrior.find(@fight.fighter_1_id)
    @fighter_2 = Warrior.find(@fight.fighter_2_id)
    @xp = helpers.strokes / 2
    @winner = helpers.winner
  end

  def new
    @fight = Fight.new
    @warriors = Warrior.all
  end

  def create
    @fight = Fight.new(fight_params)
    @fight.strokes = helpers.strokes
    @fight.winner = helpers.winner.name
    if @fight.valid?
      @fight.save
      helpers.update_xp
      redirect_to fight_path(@fight)
    else
      render :new
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:fighter_1_id, :fighter_2_id)
  end

  def set_fight
    @fight = Fight.find(params[:id])
  end

  def set_fighters
    @fighter_1 = Warrior.find(params["fight"]["fighter_1_id"].to_i)
    @fighter_2 = Warrior.find(params["fight"]["fighter_2_id"].to_i)
  end
end
