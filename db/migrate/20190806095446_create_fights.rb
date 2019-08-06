class CreateFights < ActiveRecord::Migration[6.0]
  def change
    create_table :fights do |t|
      t.references :fighter_1, null: false, foreign_key: true
      t.references :fighter_2, null: false, foreign_key: true
      t.integer :strokes
      t.string :winner

      t.timestamps
    end
  end
end
