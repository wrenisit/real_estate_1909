require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/room'

class RoomTest < Minitest::Test

  def test_it_is_a_room
    room = Room.new(:bedroom, 10, 13)
    assert_instance_of Room, room
    assert_equal :bedroom, room.category
    assert_equal 10, room.length
    assert_equal 13, room.width
    assert_equal 130, room.area
  end
end
