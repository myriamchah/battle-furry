class Accessory < ApplicationRecord
  has_many :fights_as_accessory_1, inverse_of: :accessory_1, class_name: 'Fight', foreign_key: 'accessory_1_id'
  has_many :fights_as_accessory_2, inverse_of: :accessory_2, class_name: 'Fight', foreign_key: 'accessory_2_id'

  validates :category, :name, :effect, presence: true

  def self.list_names
    Accessory.all.map { |acc| acc.name }
  end
end
