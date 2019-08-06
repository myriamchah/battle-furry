class Warrior < ApplicationRecord
  has_many :fights_as_fighter_1, inverse_of: :fighter_1, class_name: 'Fight', foreign_key: 'fighter_1_id'
  has_many :fights_as_fighter_2, inverse_of: :fighter_2, class_name: 'Fight', foreign_key: 'fighter_2_id'

  validates :name, :life_points, :strength, :xp, presence: true
  validates :life_points, numericality: { only_integer: true, less_than_or_equal_to: 200 }
  validates :strength, numericality: { only_integer: true, less_than_or_equal_to: 10 }
  validates :xp, numericality: { only_integer: true }
  attribute :xp, :integer, default: 0
end
