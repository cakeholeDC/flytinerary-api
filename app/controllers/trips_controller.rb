class TripsController < ApplicationController

	def index
		trips = Trip.all.sort_by { |trip| trip.start }
		serialize_data(trips)
	end
	
	def show
		trip = Trip.find(params[:id])
		serialize_data(trip)
	end

	def create
		trip = Trip.create(
			title: params[:title], 
			destination: params[:destination], 
			start: DateTime.parse(params[:start])
			end: DateTime.parse(params[:end]), 
			organizer: User.find(params[:user_id]), 
			image: params[:image],
			latitude: params[:latitude],
			longitude: params[:longitude],
		)
		
		trip.users.push(User.find(params[:user_id]))

		serialize_data(trip)
	end

	def update
		trip = Trip.find(params[:id])

		start_date = Trip.parseDateTimeString(params[:start])
		end_date = Trip.parseDateTimeString(params[:end])

		trip.nickname = params[:nickname]
		trip.destination = params[:destination]
		trip.start_date = Time.new(start_date[0], start_date[1], start_date[2]) 
		trip.end_date = Time.new(end_date[0], end_date[1], end_date[2])
		trip.user_id = params[:user_id]
		trip.image = params[:image]

		trip.save

		serialize_data(trip)
			
	end

	def destroy
		tripID = params[:id]
		Trip.destroy(tripID)
	end


	private

	def serialize_data(data)
		render json: data.to_json(
			except: [:user_id, :updated_at, :created_at],
			include: [
				organizer: {except: [:created_at, :updated_at, :password_digest]} ,
				attendees: {except: [:created_at, :updated_at, :password_digest]},
				event_timeline: { except: [:created_at, :updated_at, :trip_id] } 
			]
		)
	end

end