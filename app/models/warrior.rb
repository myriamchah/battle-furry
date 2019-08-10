class Warrior < ApplicationRecord
  has_many :fights_as_fighter_1, inverse_of: :fighter_1, class_name: 'Fight', foreign_key: 'fighter_1_id'
  has_many :fights_as_fighter_2, inverse_of: :fighter_2, class_name: 'Fight', foreign_key: 'fighter_2_id'

  validates :name, :life_points, :strength, :xp, presence: true
  validates :life_points, numericality: { only_integer: true, less_than_or_equal_to: 200 }
  validates :strength, numericality: { only_integer: true, less_than_or_equal_to: 10 }
  validates :xp, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  attribute :xp, :integer, default: 0
  has_one_attached :avatar

  def fights_nb
    self.fights_as_fighter_1.count + self.fights_as_fighter_2.count
  end

  def wins_nb
    Fight.all.where(winner: self.name).count
  end

  def wins_rate
    rate = (wins_nb / fights_nb.to_f * 100).round(1)
    rate.nan? ? 0 : rate
  end

  def update_xp(strokes)
    new_xp = self.xp + (strokes / 2)
    self.update(xp: new_xp)
  end
end
