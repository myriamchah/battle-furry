class AddAccessoriesToFights < ActiveRecord::Migration[6.0]
  def change
    add_reference :fights, :accessory_1, index: true
    add_foreign_key :fights, :accessories, column: :accessory_1_id
    add_reference :fights, :accessory_2, index: true
    add_foreign_key :fights, :accessories, column: :accessory_2_id
  end
end
