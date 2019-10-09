class House
  attr_reader :price, :address, :rooms, :specific_rooms, :area
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @area = 0
  end

  def add_room(room)
    @rooms << room
    @area += room.area
  end

  def rooms_from_category(category)
    @specific_rooms = []
    @rooms.each do |room|
      if room.category == category
        @specific_rooms << room
      end
    end
    @specific_rooms
  end

end
