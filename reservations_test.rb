require 'test/unit'
require 'minitest/autorun'
require "./reservation.rb"

class TestReservations < Test::Unit::TestCase

  def setup
    @location = Location.new("Ciucikowo", 17)
    @hotel = Hotel.new("Ciucik Hotel", 123, @location)
  end

  def test_location
  	location = Location.new("Ciucikowo", 17)

    assert_equal "Ciucikowo", location.name
    assert_equal 17, location.fee
  end

  def test_searching_test
    Location.new("Ciucikowo", 17)

    location = Location.find_by_name("Ciucikowo")
    assert_equal "Ciucikowo", location.name
   
   location = Location.find_by_name("CiucikowoFoo")
    assert_equal nil, location
  end

  def test_hotel
    hotel = Hotel.new("Ciucik Hotel", 123, @location)

    assert_equal "Ciucik Hotel", hotel.name
    assert_equal 123, hotel.cost
    assert_equal @location, hotel.location
  end

  def test_reservation
    reservation = Reservation.new(2, @hotel)

    assert_equal 280, reservation.price
    assert_equal "2 days in Ciucik Hotel, Ciucikowo, cost 280", reservation.to_s
  end

  # def assert_equal(expected, actual)
  #   expected == actual
  # end
end
