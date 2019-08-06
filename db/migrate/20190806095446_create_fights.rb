class CreateFights < ActiveRecord::Migration[6.0]
  def change
    create_table :fights do |t|
      t.references :fighter_1, null: false, foreign_key: {to_table: :warriors}
      t.references :fighter_2, null: false, foreign_key: {to_table: :warriors}
      t.integer :strokes
      t.string :winner

      t.timestamps
    end
  end
end
