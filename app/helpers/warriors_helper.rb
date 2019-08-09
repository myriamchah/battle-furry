module WarriorsHelper

 #get avatar with active storage
  def war_avatar(warrior)
    unless warrior.avatar.nil?
      image_tag(warrior.avatar)
    end
  end

#return the name and number of victories of the best catfighter, used on fights#index
  def best_winner
    wins = Fight.all.group_by(&:winner).transform_values(&:count)
    return "The best catfighter is #{wins.max_by(&:last).first}, with #{wins.max_by(&:last).last} victories!"
  end

#return the name and number of points of the most experienced fighter, used on fights#index
  def best_xp
    warrior = Warrior.all.max_by(&:xp)
    return "The most experienced fighter is #{warrior.name}, with #{warrior.xp} XP points."
  end

#return nb of fights
  def fights_nb
    @warrior.fights_as_fighter_1.count + @warrior.fights_as_fighter_2.count
  end

#return nb of victories
  def wins_nb
    Fight.all.where(winner: @warrior.name).count
  end

#return % of victories
  def wins_rate
    rate = wins_nb / fights_nb.to_f * 100
    rate.nan? ? 0 : rate
  end
end
