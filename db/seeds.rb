UserTrip.destroy_all
Event.destroy_all
Trip.destroy_all
User.destroy_all

###### CREATE TRAVELLERS ######
kyle = User.create(username: "cakehole", first_name: "Kyle", last_name: "Cole", password: "password")
sulli = User.create(username: "sullivie", first_name: "Sulli", last_name: "Norris", password: "password")
dave = User.create(username: "dc", first_name: "Dave", last_name: "Conetta", password: "password")
david = User.create(username: "dtrain", first_name: "David", last_name: "Braun", password: "password")
perry = User.create(username: "pearbear", first_name: "Perry", last_name: "Mosbacher", password: "password")
kyle2 = User.create(username: "spanky", first_name: "Kyle", last_name: "Rowe", password: "password")
scott = User.create(username: "scoots", first_name: "Scott", last_name: "Tucker", password: "password")
tom = User.create(username: "tdubs", first_name: "Tom", last_name: "White", password: "password")

# byebug

###### CREATE TRIPS ###### 
christmas = Trip.create(
	title: "Christmas 2019", 
	destination: "Raleigh, NC", 
	latitude: 35.7804,
	longitude: -78.6391,
	start: Time.new(2019, 12, 22), 
	end: Time.new(2019, 12, 29), 
	organizer: sulli, 
	image: "https://www.downtownraleigh.org/_files/images/sunset_raleighskyline.jpg"
)

christmas.users.push(kyle, sulli)
christmas.save

# UserTrip.create(user: kyle, trip: christmas)
# UserTrip.create(user: sulli, trip: christmas)

ski2020 = Trip.create(
	title: "Denver 2020", 
	destination: "Breckenridge, Colorado", 
	latitude: 39.4817,
	longitude: -106.0384,
	start: Time.new(2020, 2, 26), 
	end: Time.new(2020, 3, 2), 
	organizer: kyle, 
	image: "https://www.colorado.com/sites/default/files/styles/1000x685/public/breckskitown.jpg?itok=wI8d67RA"
)

ski2020.users.push(kyle, kyle2, dave, tom, david, scott)
ski2020.save

paris = Trip.create(
	title: "A Romantic Trip to Paris", 
	destination: "Paris, France", 
	latitude: 48.85658,
	longitude: 2.35183,
	start: Time.new(2020, 12, 4), 
	end: Time.new(2020, 12, 31), 
	organizer: kyle, 
	image: "https://d2mpqlmtgl1znu.cloudfront.net/AcuCustom/Sitename/DAM/020/Paris_AdobeStock_264549883_1.jpg"
)

paris.users.push(kyle, sulli)
paris.save

dc = Trip.create(
	title: "Summer in DC", 
	destination: "Washington, DC", 
	latitude: 38.895,
	longitude: -77.0366,
	start: Time.new(2020, 6, 21), 
	end: Time.new(2020, 9, 15), 
	organizer: kyle, 
	image: "https://www.earthmagazine.org/sites/earthmagazine.org/files/styles/full_width/public/2018-11/WashMallaerial_U.S.AirForcephotobyAirman1stClassPhilipBryant.png?itok=EmWOo1Y9")

dc.users.push(kyle, sulli)
dc.save

windham = Trip.create(
	title: "Lake Time", 
	destination: "Windham NH", 
	latitude: 42.7236994,
	longitude: -71.2875346,
	start: Time.new(2020, 7, 4), 
	end: Time.new(2020, 7, 31), 
	organizer: sulli, 
	image: "https://cdn.onekindesign.com/wp-content/uploads/2016/12/Cozy-Lake-House-Pritchett-Dixon-01-1-Kindesign.jpg")

windham.users.push(sulli, kyle)
windham.save

###### CREATE EVENT CATEGORIES ########
flight = Category.create(name: "flight")
lodging = Category.create(name: "lodging")
reservation = Category.create(name: "reservation")
meal = Category.create(name: "meal")
other = Category.create(name: "other")

###### CREATE EVENTS ######
flight1 = Event.create(
					trip: ski2020,
					category: flight, 
					user: kyle,
					title: "Kyle C arrives in Denver",
					start: Time.new(2020, 2, 26, 6, 55),
					end: Time.new(2020, 2, 26, 11, 45),
					location: "DCA",
					latitude: 11.749149,
					longitude: 108.369038,
					company_agency: "Southwest",
					reservation_number: 469,
					notes: "Transfer in Dallas TX",
					)

skiAtBreck = Event.create(
					trip: ski2020,
					category: other, 
					user: kyle,
					title: "Copper Mtn",
					start: Time.new(2020, 2, 28, 8, 00),
					end: Time.new(2020, 2, 26, 16, 00),
					location: "Copper Mountian",
					latitude: 39.502141,
					longitude: -106.1509952,
					company_agency: "",
					reservation_number: nil,
					notes: "Skiing with the Coles",
					)


flight2 = Event.create(
					trip: ski2020,
					category: flight, 
					user: kyle,
					title: "Kyle C departs Denver",
					start: Time.new(2020, 3, 3, 2, 30),
					end: Time.new(2020, 3, 3, 17, 00),
					location: "DEN",
					latitude: 39.769941,
					longitude: -104.796653,
					company_agency: "American Airlines",
					reservation_number: 2780,
					notes: "Transfer at O'Hare (Chicago)",
					)

denCheckIn = Event.create(
					trip: ski2020,
					category: lodging, 
					user: david,
					title: "Checkin to Air BNB",
					start: Time.new(2020, 2, 26, 11, 30),
					end: Time.new(2020, 2, 26, 11, 45),
					location: "800 Columbine Road, Breckenridge, CO 80424",
					latitude: 39.473297,
					longitude: -106.045973,
					company_agency: "VRBO",
					reservation_number: "DB-2020",
					notes: "Reservation is under BRAUN, DAVID",
					)