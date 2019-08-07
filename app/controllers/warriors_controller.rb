class WarriorsController < ApplicationController
  before_action :set_warrior, only: [:show, :edit, :update, :destroy]

  def index
    @warriors = Warrior.all
  end

  def show
  end

  def new
    @warrior = Warrior.new
  end

  def create
    @warrior = Warrior.new(warrior_params)
    if @warrior.valid?
      @warrior.save
      redirect_to warriors_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @warrior.update(warrior_params)
    redirect_to warriors_path
  end

  def destroy
    @warrior.destroy
    redirect_to warriors_path
  end

  private

  def warrior_params
    params.require(:warrior).permit(:name, :intro, :avatar, :life_points, :strength)
  end

  def set_warrior
    @warrior = Warrior.find(params[:id])
  end
end

