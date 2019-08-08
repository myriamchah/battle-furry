class PagesController < ApplicationController
  def home
    @fight = Fight.new
    @warriors = Warrior.all
  end
end
