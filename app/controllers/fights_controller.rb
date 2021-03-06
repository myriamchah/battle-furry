class FightsController < ApplicationController
  before_action :set_fight, only: [:show]
  before_action :set_fighters, only: [:create]
  before_action :set_accessories, only: [:create]

  def index
    @fights = Fight.all
  end

  def show
    @fighter_1 = Warrior.find(@fight.fighter_1_id)
    @fighter_2 = Warrior.find(@fight.fighter_2_id)
    @accessory_1 = Accessory.find(@fight.accessory_1_id)
    @accessory_2 = Accessory.find(@fight.accessory_2_id)
    @xp = @fight.strokes / 2
    @winner = Warrior.find_by_name(@fight.winner)
  end

  def new
    @fight = Fight.new
    @warriors = Warrior.all
  end

  def create
    @fight = Fight.new(fight_params)
    helpers.compute_outcome
    if @fight.valid?
      @fight.save
      Warrior.find_by_name(@fight.winner).update_xp(@fight.strokes) if @fight.winner != "Ex-aequo"
      redirect_to fight_path(@fight)
    else
      redirect_to root_path
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:fighter_1_id, :fighter_2_id, :accessory_1_id, :accessory_2_id)
  end

  def set_fight
    @fight = Fight.find(params[:id])
  end

  def set_fighters
    @fighter_1 = Warrior.find(params["fight"]["fighter_1_id"].to_i)
    @fighter_2 = Warrior.find(params["fight"]["fighter_2_id"].to_i)
  end

  def set_accessories
    @accessory_1 = Accessory.find(params["fight"]["accessory_1_id"])
    @accessory_2 = Accessory.find(params["fight"]["accessory_2_id"])
  end
end
