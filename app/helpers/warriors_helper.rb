module WarriorsHelper

  def war_avatar(warrior)
    unless warrior.avatar.nil?
      image_tag(warrior.avatar)
    end
  end

  def best_winner
    wins = Fight.all.group_by(&:winner).transform_values(&:count)
    return "The best catfighter is #{wins.max_by(&:last).first}, with #{wins.max_by(&:last).last} victories!"
  end

  def best_xp
    warrior = Warrior.all.max_by(&:xp)
    return "The most experienced fighter is #{warrior.name}, with #{warrior.xp} XP points."
  end

end
