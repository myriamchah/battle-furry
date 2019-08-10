module WarriorsHelper

 #get avatar with active storage
  def war_avatar(warrior)
    unless warrior.avatar.nil?
      image_tag(warrior.avatar)
    end
  end

#return the name and number of victories of the best catfighter, used on fights#index
# but ex-aequo may come out as a best fighter - to be fixed
  def best_winner
    wins = Fight.all.group_by(&:winner).select{|k,v| k != "Ex-aequo"}.transform_values(&:count)
    return "The best catfighter is #{wins.max_by(&:last).first}, with #{wins.max_by(&:last).last} victories!"
  end

#return the name and number of points of the most experienced fighter, used on fights#index
  def best_xp
    warrior = Warrior.all.max_by(&:xp)
    return "The most experienced fighter is #{warrior.name}, with #{warrior.xp} XP points."
  end
end
