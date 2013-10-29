require "./reservation.rb"

require 'csv'

hotels = CSV.read('hotels.csv')
locations = CSV.read('locations.csv')
reservations = CSV.read('reservations.csv')

location = nil
locations.each do |elem|
  location = Location.new(elem[0], elem[1])
end
location

# locations loaded
hotel = nil
hotels.each do |elem|
  location = Location.find_by_name(elem[2])
  hotel = Hotel.new(elem[0], elem[1], location)
end

#reservations.to_csv
completed_reservations = []
reservations.each do |elem|
  hotel = Hotel.find_by_name(elem[1])
  completed_reservations << Reservation.new(elem[0], hotel)
end

p completed_reservations




print ">"
while input = gets.chomp
  print "> "
  break if input == "END"

  if input == "Show hotels"
    print hotel
    print "/n"">"
  elsif input == "Make a reservation"
  	print "Enter hotel's name "
  	hotel_name = gets.chomp
    hotel = Hotel.find_by_name(hotel_name)
    

  	print "Enter duration of your stay "
  	duration = gets.chomp

  	reservation = Reservation.new(duration, hotel)

    
    p reservation
    Reservation.save_to_csv
  	#puts "Yours new reservations is: #{reservation.price.to_s}"
  end
end



