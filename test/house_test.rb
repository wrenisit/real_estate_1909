require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
  end

  def test_it_made_a_house
    assert_instance_of House, @house
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end

  def test_it_adds_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end

end
