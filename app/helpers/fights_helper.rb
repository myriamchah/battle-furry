module FightsHelper

  # each attack afflicts damages equal to strength, weighted by xp points and accessory as a weapon.
  # life points are updated if accessory is a shield
  def compute_outcome
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

    if life_1 == life_2
      winner = "Ex-aequo"
    elsif life_1 > life_2
      winner = @fighter_1.name
    else
      winner = @fighter_2.name
    end

    @fight.update(winner: winner, strokes: (stroke_1 + stroke_2))
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
