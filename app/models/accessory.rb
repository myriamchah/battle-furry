class Accessory < ApplicationRecord
  validates :category, :name, :effect, presence: true
end
