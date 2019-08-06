require 'test_helper'

class WarriorTest < ActiveSupport::TestCase
  test "should have a name" do
    warrior = Warrior.new(life_points: 200, strength: 10)
    assert_not warrior.valid?
  end

  test "life points should be less than 200" do
    warrior = Warrior.new(name: "Bobo", life_points: 300, strength: 10)
    assert_not warrior.valid?
  end

  test "strength should be less than 10" do
    warrior = Warrior.new(name: "Bobo", life_points: 300, strength: 10)
    assert_not warrior.valid?
  end

  test "xp default value should be 0" do
    warrior = Warrior.new
    assert_equal 0, warrior.xp
  end
end
