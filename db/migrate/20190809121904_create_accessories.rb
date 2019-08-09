class CreateAccessories < ActiveRecord::Migration[6.0]
  def change
    create_table :accessories do |t|
      t.string :category
      t.string :name
      t.integer :effect

      t.timestamps
    end
  end
end
