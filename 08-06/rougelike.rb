class Adventurer
  attr_reader :max_damage, :level
  attr_accessor :hit_points

  def initialize(level=1)
    @level = level

    @max_damage = @max_damage || 4
    # a += 1  --> a = a + 1
    # a ||= 1 --> a = a || 1
    # @hit_points_per_level = @hit_points_per_level || 10
    @hit_points_per_level ||= 10 # set a default

    @hit_points = @level * @hit_points_per_level
  end

  def damage
    rand(1..@max_damage)
  end

  def attack(other)
    other.hit_points -= self.damage
  end
end


class Villager < Adventurer
end


class Warrior < Adventurer
  def initialize(weapon, level=1)
    @weapon = weapon
    @max_damage = 8
    @hit_points_per_level = 15
    super(level)
  end
end
