class GridSquare

  HitboxOptions = {empty: ".", hit: "H", miss: "M"}

  attr_reader :hitbox, :ship

  def initialize(hitbox = ".", ship = nil)
    @hitbox = hitbox
    @ship = ship
  end

end

# new_square = GridSquare.new
