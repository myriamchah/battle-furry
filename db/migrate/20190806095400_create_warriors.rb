class CreateWarriors < ActiveRecord::Migration[6.0]
  def change
    create_table :warriors do |t|
      t.string :name
      t.string :intro
      t.string :avatar
      t.integer :life_points
      t.integer :strength
      t.integer :xp

      t.timestamps
    end
  end
end
