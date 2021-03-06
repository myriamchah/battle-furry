class Fight < ApplicationRecord
  belongs_to :fighter_1, class_name: 'Warrior', foreign_key: 'fighter_1_id'
  belongs_to :fighter_2, class_name: 'Warrior', foreign_key: 'fighter_2_id'
  belongs_to :accessory_1, class_name: 'Accessory', foreign_key: 'accessory_1_id'
  belongs_to :accessory_2, class_name: 'Accessory', foreign_key: 'accessory_2_id'

  validates :fighter_1, :fighter_2, presence: true
  attribute :strokes, :integer, default: 0
end
