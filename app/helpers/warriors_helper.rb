module WarriorsHelper

 #get avatar with active storage
  def war_avatar(warrior)
    if warrior.avatar.attached?
      image_tag(warrior.avatar)
    end
  end

#return the name and number of victories of the best catfighter, used on fights#index
  def best_winner
    wins = Fight.all.group_by(&:winner).select{|k,v| k != "Ex-aequo"}.transform_values(&:count)
    if !wins.empty?
      return "The best catfighter is #{wins.max_by(&:last).first}, with #{wins.max_by(&:last).last} victories!"
    end
  end

#return the name and number of points of the most experienced fighter, used on fights#index
  def best_xp
    warrior = Warrior.all.max_by(&:xp)
    if warrior.xp != 0
      return "The most experienced fighter is #{warrior.name}, with #{warrior.xp} XP points."
    else
      return "Too soon to tell..."
    end
  end
end
