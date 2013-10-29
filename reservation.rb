# Reservations system:
# (duration * (hotel_price + local_fee))
#
# Output
# 3 days in Ciucik Hotel, Ciucikowo, cost 234
#require 'csv'
#CSV.open("reservations.csv", "w") do |csv|
 # csv << ["row", "of", "CSV", "data"]
#end

class Location
  attr_reader :name, :fee
  @@locations = []

  def initialize(name, fee)
    @name, @fee = name, fee.to_i

    @@locations << self
  end

  def self.find_by_name(name)
    found_location = nil
    @@locations.each do |location|
      if location.name == name
        found_location = location
      end
    end

    found_location
  end

  def to_s
    "#{@name}, #{@fee}"
  end
end

class Hotel
  attr_reader :name, :cost, :location
  @@hotels = []

  def initialize(name, cost, location)
    @name, @cost, @location = name, cost.to_i, location

    @@hotels << self
  end

  def to_s
    "#{@name}, #{@cost}, #{@location.name}"
  end

  def self.find_by_name(name)
    found_hotel = nil
    @@hotels.each do |hotel|
      if hotel.name == name
        found_hotel = hotel
      end
    end

    found_hotel
  end
end


class Reservation
  @@reservations = []

  def initialize(duration, hotel)
    puts "HOTEL: #{hotel}"
    @duration = duration.to_i
    @hotel    = hotel

    @@reservations << self
  end

  def self.save_to_csv
    require 'csv'  

    CSV.open("reservations.csv", "w") do |csv|
       @@reservations.each do |reservation|
        csv << reservation.to_csv
      end
    end
  end

  def price
    @duration * (@hotel.cost + @hotel.location.fee)
  end

  def to_csv
    [@duration, @hotel.name]
  end

  def to_s
    "#{@duration} days in #{@hotel.name}, #{@hotel.location.name}, cost #{self.price}"
  end

end

