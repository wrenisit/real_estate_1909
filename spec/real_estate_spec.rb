require 'rspec'
require 'pry'
require 'simplecov'
SimpleCov.start
require './lib/room'
require './lib/house'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe "Real Estate Spec Harness" do
  before :each do
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:living_room, 25, 15)
    @room_3 = Room.new(:bedroom, 11, 15)
    @room_4 = Room.new(:basement, 30, 41)
    @house = House.new("$400000", "123 sugar lane")
  end

  describe 'iteration 1' do
    it '1. Room Instantiation' do
      expect(Room).to respond_to(:new).with(3).argument
      expect(@room_1).to be_an_instance_of(Room)
    end

    it '2. Room #category' do
      expect(@room_1).to respond_to(:category).with(0).argument
      expect(@room_1.category).to eq(:bedroom)
    end

    it '3. Room #area' do
      expect(@room_1).to respond_to(:area).with(0).argument
      expect(@room_1.area).to eq(130)
    end
  end

  describe 'iteration 2' do
    it '1. House Instantiation' do
      expect(House).to respond_to(:new).with(2).argument
      expect(@house).to be_an_instance_of(House)
    end

    it '2. House #price' do
      expect(@house).to respond_to(:price).with(0).argument
      expect(@house.price).to eq(400000)
    end

    it '3. House #address' do
      expect(@house).to respond_to(:address).with(0).argument
      expect(@house.address).to eq("123 sugar lane")
    end

    it '4. House #rooms' do
      expect(@house).to respond_to(:rooms).with(0).argument
      expect(@house.rooms).to eq([])
    end

    it '5. House #add_room' do
      @house.add_room(@room_1)
      @house.add_room(@room_2)

      expect(@house).to respond_to(:add_room).with(1).argument
      expect(@house.rooms).to eq([@room_1, @room_2])
    end
  end

  describe 'iteration 3' do
    before :each do
      @house.add_room(@room_1)
      @house.add_room(@room_2)
      @house.add_room(@room_3)
      @house.add_room(@room_4)
    end

    it '1. House #rooms_from_category' do
      expect(@house).to respond_to(:rooms_from_category).with(1).argument
      expect(@house.rooms_from_category(:bedroom)).to eq([@room_1, @room_3])
      expect(@house.rooms_from_category(:basement)).to eq([@room_4])
    end

    it '2. House #area' do
      expect(@house).to respond_to(:area).with(0).argument
      expect(@house.area).to eq(1900)
    end
  end

  describe 'iteration 4' do
    before :each do
      @house.add_room(@room_1)
      @house.add_room(@room_2)
      @house.add_room(@room_3)
      @house.add_room(@room_4)
    end

    it '1. House #price_per_square_foot' do
      expect(@house).to respond_to(:price_per_square_foot).with(0).argument
      expect(@house.price_per_square_foot).to eq(210.53)
    end

    it '2. House #rooms_sorted_by_area' do
      expected = [@room_4, @room_2, @room_3, @room_1]

      expect(@house).to respond_to(:rooms_sorted_by_area).with(0).argument
      expect(@house.rooms_sorted_by_area).to eq(expected)
    end

    it '3. House #rooms_by_category' do
      expected = {
        bedroom: [@room_1, @room_3],
        living_room: [@room_2],
        basement: [@room_4],
      }

      expect(@house).to respond_to(:rooms_by_category).with(0).argument
      expect(@house.rooms_by_category).to eq(expected)
    end
  end
end
