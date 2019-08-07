module FightsHelper
  def strokes
    stroke_2 = @fighter_1.life_points / @fighter_2.strength
    stroke_1 = @fighter_2.life_points / @fighter_1.strength
    return stroke_1 + stroke_2
  end

  def winner
    stroke_2 = @fighter_1.life_points / @fighter_2.strength.to_f
    stroke_1 = @fighter_2.life_points / @fighter_1.strength.to_f
    if stroke_1 == stroke_2
      return "Ex-aequo"
    elsif stroke_1 < stroke_2
      return @fighter_1.name
    else
      return @fighter_2.name
    end
  end
end
