module WarriorsHelper

  def war_avatar(warrior)
    unless warrior.avatar.nil?
      image_tag(warrior.avatar)
    end
  end
end
