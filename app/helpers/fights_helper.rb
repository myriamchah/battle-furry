module FightsHelper

  def strokes
    stroke_1 = 0
    stroke_2 = 0

    life_1 = @fighter_1.life_points
    life_2 = @fighter_2.life_points

    until life_1 <= 0 || life_2 <= 0 do
      life_2 -= (@fighter_1.strength * (1 + @fighter_1.xp * 0.01))
      stroke_1 += 1
      life_1 -= (@fighter_2.strength * (1 + @fighter_2.xp * 0.01))
      stroke_2 += 1
    end

    stroke_1 + stroke_2
  end

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

  def update_xp
    warrior = winner
    new_xp = warrior.xp + (strokes.to_i / 2)
    warrior.update(xp: new_xp)
  end
end
