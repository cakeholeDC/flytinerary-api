TravelerEvent.destroy_all
TravelerTrip.destroy_all
Event.destroy_all
Trip.destroy_all
Traveler.destroy_all

# CREATE TRAVELLERS
kyle = Traveler.create!(name: "Kyle Cole", age: 31, gender: "M")
sulli = Traveler.create!(name: "Sulli Norris", age: 30, gender: "F")
dave = Traveler.create!(name: "Dave Conetta", age: 31, gender: "M")
david = Traveler.create!(name: "David Braun", age: 31, gender: "M")
perry = Traveler.create!(name: "Perry Mosbacher", age: 30, gender: "M")
kyle2 = Traveler.create!(name: "Kyle Rowe", age: 31, gender: "M")
scott = Traveler.create!(name: "Scott Tucker", age: 29, gender: "M")
tom = Traveler.create!(name: "Tom White", age: 32, gender: "M")


# CREATE TRIPS
christmas = Trip.create!(
	nickname: "Christmas 2019", 
	destination: "Raleigh, NC", 
	start_datetime: Time.new(2019, 12, 22), 
	end_datetime: Time.new(2019, 12, 29), 
	organizer: sulli, 
	image: "https://www.downtownraleigh.org/_files/images/sunset_raleighskyline.jpg")

ski2020 = Trip.create!(
	nickname: "Denver 2020", 
	destination: "Denver, Colorado", 
	start_datetime: Time.new(2020, 2, 26), 
	end_datetime: Time.new(2020, 3, 2), 
	organizer: kyle, 
	image: "https://www.colorado.com/sites/default/files/styles/1000x685/public/breckskitown.jpg?itok=wI8d67RA")

paris = Trip.create!(
	nickname: "A Romantic Trip to Paris", 
	destination: "Paris, France", 
	start_datetime: Time.new(2020, 12, 4), 
	end_datetime: Time.new(2020, 12, 31), 
	organizer: kyle, 
	image: "https://d2mpqlmtgl1znu.cloudfront.net/AcuCustom/Sitename/DAM/020/Paris_AdobeStock_264549883_1.jpg")

# CREATE EVENTS
flight1 = Event.create!(
					trip: ski2020,
					event_type: "flight", 
					start_datetime: Time.new(2020, 2, 26, 6, 55),
					end_datetime: Time.new(2020, 2, 26, 11, 45),
					start_location: "DCA",
					end_location: "DEN",
					company_agency: "Southwest",
					reservation_number: 469,
					notes: "Transfer in Dallas TX",
					)

TravelerEvent.create(traveler: kyle, event: flight1)
TravelerTrip.create(traveler: kyle, trip: ski2020)

flight2 = Event.create!(
					trip: ski2020,
					event_type: "flight", 
					start_datetime: Time.new(2020, 3, 3, 2, 30),
					end_datetime: Time.new(2020, 3, 3, 17, 00),
					start_location: "DEN",
					end_location: "DCA",
					company_agency: "American Airlines",
					reservation_number: 2780,
					notes: "Transfer at O'Hare (Chicago)",
					)

TravelerEvent.create(traveler: kyle , event: flight2)
TravelerTrip.create(traveler: kyle , trip: ski2020)

denCheckIn = Event.create!(
					trip: ski2020,
					event_type: "lodging", 
					start_datetime: Time.new(2020, 2, 26, 6, 55),
					end_datetime: Time.new(2020, 2, 26, 11, 45),
					start_location: "800 Columbine Road, Breckenridge, CO 80424",
					end_location: "800 Columbine Road, Breckenridge, CO 80424",
					company_agency: "VRBO",
					reservation_number: "DB-2020",
					notes: "Reservation is under BRAUN, DAVID",
					)

TravelerEvent.create(traveler: david, event: denCheckIn)
TravelerTrip.create(traveler: david, trip: ski2020)


# dinnerRes = Event.create!(
# 					traveler: sulli
# 					trip: christmas,
# 					event_type: "reservation", 
# 					start_datetime: Time.new(2019, 12, 22, 6, 30),
# 					end_datetime: Time.new(2019, 12, 22, 7, 45),
# 					start_location:,
# 					end_location: ,
# 					company_agency:,
# 					reservation_number: ,
# 					notes: "Reservation at Fancy Restaurant",
# 					)

# checkin = Event.create!(
# 					traveler: sulli
# 					trip: paris,
# 					event_type: "check-in", 
# 					start_datetime: Time.new(2019, 12, 22, 15, 00),
# 					end_datetime: Time.new(2019, 12, 22, 15, 15),
# 					start_location:,
# 					end_location: ,
# 					company_agency:,
# 					reservation_number: ,
# 					notes: "Check-in to AirBnb @ 123 Address St",
# 					)
