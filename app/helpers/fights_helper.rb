module FightsHelper

  # each attack afflicts damages equal to strength, weighted by xp points and accessory as a weapon.
  # life points are updated if accessory is a shield
  def strokes
    stroke_1 = 0
    stroke_2 = 0

    life_1 = compute_life_points(@fighter_1, @accessory_1)
    life_2 = compute_life_points(@fighter_2, @accessory_2)

    attack_1 = compute_attack_points(@fighter_1, @accessory_1)
    attack_2 = compute_attack_points(@fighter_2, @accessory_2)


    until life_1 <= 0 || life_2 <= 0 do
      life_2 -= (attack_1 * (1 + @fighter_1.xp * 0.01))
      stroke_1 += 1
      life_1 -= (attack_2 * (1 + @fighter_2.xp * 0.01))
      stroke_2 += 1
    end

    stroke_1 + stroke_2
  end

# the winner is the one who had to hit less
  def winner
    stroke_2 = @fighter_1.life_points / @fighter_2.strength.to_f
    stroke_1 = @fighter_2.life_points / @fighter_1.strength.to_f
    if stroke_1 == stroke_2
      return "Ex-aequo"
    elsif stroke_1 < stroke_2
      return @fighter_1
    else
      return @fighter_2
    end
  end

# the winner gets as many xp points as hits given
  def update_xp
    if winner != "Ex-aequo"
      warrior = winner
      new_xp = warrior.xp + (strokes.to_i / 2)
      warrior.update(xp: new_xp)
    end
  end

# get the name of a warrior, used in fights#index
  def fighter_name(id)
    Warrior.find(id).name
  end

  def compute_life_points(warrior, accessory)
    if accessory.category == "shield"
      warrior.life_points + accessory.effect
    else
      warrior.life_points
    end
  end

 def compute_attack_points(warrior, accessory)
    if accessory.category == "weapon"
      warrior.strength * accessory.effect
    else
      warrior.strength
    end
  end
end
