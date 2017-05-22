class Ship

  attr_reader :length
  
  SHIP_SIZE = {first: 2, second: 3}

  def initialize(type)
      @type = type
      @length = SHIP_SIZE[type]
      @hits = 0
  end

end
