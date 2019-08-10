class RemoveAvatarFromWarrior < ActiveRecord::Migration[6.0]
  def change
    remove_column :warriors, :avatar
  end
end
