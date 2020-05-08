TravelerEvent.destroy_all
TravelerTrip.destroy_all
Event.destroy_all
Trip.destroy_all
Traveler.destroy_all

###### CREATE TRAVELLERS ######
kyle = Traveler.create!(username: "cakehole", first_name: "Kyle", last_name: "Cole", age: 31, password: "password")
sulli = Traveler.create!(username: "sullivie", first_name: "Sulli", last_name: "Norris", age: 30, password: "password")
dave = Traveler.create!(username: "dc", first_name: "Dave", last_name: "Conetta", age: 31, password: "password")
david = Traveler.create!(username: "dtrain", first_name: "David", last_name: "Braun", age: 31, password: "password")
perry = Traveler.create!(username: "pearbear", first_name: "Perry", last_name: "Mosbacher", age: 30, password: "password")
kyle2 = Traveler.create!(username: "spanky", first_name: "Kyle", last_name: "Rowe", age: 31, password: "password")
scott = Traveler.create!(username: "scoots", first_name: "Scott", last_name: "Tucker", age: 29, password: "password")
tom = Traveler.create!(username: "tdubs", first_name: "Tom", last_name: "White", age: 32, password: "password")

###### CREATE TRIPS ###### 
christmas = Trip.create!(
	nickname: "Christmas 2019", 
	destination: "Raleigh, NC", 
	latitude: 35.7804,
	longitude: -78.6391,
	start_datetime: Time.new(2019, 12, 22), 
	end_datetime: Time.new(2019, 12, 29), 
	organizer: sulli, 
	image: "https://www.downtownraleigh.org/_files/images/sunset_raleighskyline.jpg")

TravelerTrip.create(traveler: kyle, trip: christmas)
TravelerTrip.create(traveler: sulli, trip: christmas)

ski2020 = Trip.create!(
	nickname: "Denver 2020", 
	destination: "Breckenridge, Colorado", 
	latitude: 39.4817,
	longitude: -106.0384,
	start_datetime: Time.new(2020, 2, 26), 
	end_datetime: Time.new(2020, 3, 2), 
	organizer: kyle, 
	image: "https://www.colorado.com/sites/default/files/styles/1000x685/public/breckskitown.jpg?itok=wI8d67RA")

TravelerTrip.create(traveler: kyle, trip: ski2020)
TravelerTrip.create(traveler: kyle2, trip: ski2020)
TravelerTrip.create(traveler: dave, trip: ski2020)
TravelerTrip.create(traveler: tom, trip: ski2020)
TravelerTrip.create(traveler: david, trip: ski2020)
TravelerTrip.create(traveler: scott, trip: ski2020)

paris = Trip.create!(
	nickname: "A Romantic Trip to Paris", 
	destination: "Paris, France", 
	latitude: 48.85658,
	longitude: 2.35183,
	start_datetime: Time.new(2020, 12, 4), 
	end_datetime: Time.new(2020, 12, 31), 
	organizer: kyle, 
	image: "https://d2mpqlmtgl1znu.cloudfront.net/AcuCustom/Sitename/DAM/020/Paris_AdobeStock_264549883_1.jpg")

TravelerTrip.create(traveler: kyle, trip: paris)
TravelerTrip.create(traveler: sulli, trip: paris)

dc = Trip.create!(
	nickname: "Summer in DC", 
	destination: "Washington, DC", 
	latitude: 38.895,
	longitude: -77.0366,
	start_datetime: Time.new(2020, 6, 21), 
	end_datetime: Time.new(2020, 9, 15), 
	organizer: kyle, 
	image: "https://www.earthmagazine.org/sites/earthmagazine.org/files/styles/full_width/public/2018-11/WashMallaerial_U.S.AirForcephotobyAirman1stClassPhilipBryant.png?itok=EmWOo1Y9")

TravelerTrip.create(traveler: kyle, trip: dc)
TravelerTrip.create(traveler: sulli, trip: dc)

windham = Trip.create!(
	nickname: "Lake Time", 
	destination: "Windham NH", 
	latitude: 42.7236994,
	longitude: -71.2875346,
	start_datetime: Time.new(2020, 7, 4), 
	end_datetime: Time.new(2020, 7, 31), 
	organizer: sulli, 
	image: "https://cdn.onekindesign.com/wp-content/uploads/2016/12/Cozy-Lake-House-Pritchett-Dixon-01-1-Kindesign.jpg")

TravelerTrip.create(traveler: sulli, trip: windham)
TravelerTrip.create(traveler: kyle, trip: windham)



###### CREATE EVENTS ######
flight1 = Event.create!(
					trip: ski2020,
					event_type: "flight", 
					start_datetime: Time.new(2020, 2, 26, 6, 55),
					end_datetime: Time.new(2020, 2, 26, 11, 45),
					start_location: "DCA",
					start_latitude: 38.8512462,
					start_longitude: -77.042420,
					end_location: "DEN",
					end_latitude: 39.769941,
					end_longitude: -104.796653,
					company_agency: "Southwest",
					reservation_number: 469,
					notes: "Transfer in Dallas TX",
					)

TravelerEvent.create(traveler: kyle, event: flight1)

flight2 = Event.create!(
					trip: ski2020,
					event_type: "flight", 
					start_datetime: Time.new(2020, 3, 3, 2, 30),
					end_datetime: Time.new(2020, 3, 3, 17, 00),
					start_location: "DEN",
					start_latitude: 39.769941,
					start_longitude: -104.796653,
					end_location: "DCA",
					end_latitude: 38.8512462,
					end_longitude: -77.042420,
					company_agency: "American Airlines",
					reservation_number: 2780,
					notes: "Transfer at O'Hare (Chicago)",
					)

TravelerEvent.create(traveler: kyle , event: flight2)

denCheckIn = Event.create!(
					trip: ski2020,
					event_type: "lodging", 
					start_datetime: Time.new(2020, 2, 26, 6, 55),
					end_datetime: Time.new(2020, 2, 26, 11, 45),
					start_location: "800 Columbine Road, Breckenridge, CO 80424",
					start_latitude: 39.473297,
					start_longitude: -106.045973,
					end_location: "800 Columbine Road, Breckenridge, CO 80424",
					end_latitude: 39.473297,
					end_longitude: -106.045973,
					company_agency: "VRBO",
					reservation_number: "DB-2020",
					notes: "Reservation is under BRAUN, DAVID",
					)

TravelerEvent.create(traveler: david, event: denCheckIn)