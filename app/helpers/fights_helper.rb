module FightsHelper
  def strokes
    stroke_2 = @fighter_1.life_points / (@fighter_2.strength * (1 + (@fighter_2.xp / 100)))
    stroke_1 = @fighter_2.life_points / (@fighter_1.strength * (1 + (@fighter_1.xp / 100)))
    return stroke_1 + stroke_2
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
