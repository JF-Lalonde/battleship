class GridSquare

  GRID_OPTION = {empty: ".", hit: "H", miss: "M",
                  ship_one: "1", ship_two: "2"}

  attr_accessor :hitbox, :ship

  def initialize(hitbox = :empty, ship = nil)
    @hitbox = hitbox
    @ship = ship
  end

  def hitbox_status
    GRID_OPTION[@hitbox]
  end

end

# new_square = GridSquare.new
