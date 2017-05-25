class GridSquare

  GRID_OPTION = {empty: ".", hit: "H", miss: "M",
                  first: "F", second: "S"}

  attr_accessor :hitbox

  def initialize(hitbox = :empty)
    @hitbox = hitbox
  end

  def hitbox_status
    GRID_OPTION[@hitbox]
  end

  def hit
    @hitbox = :hit
  end

  def miss
    @hitbox = :miss
  end
end
