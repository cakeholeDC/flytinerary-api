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

		start_datetime = Trip.parseDateString(params[:start])
		end_date = Trip.parseDateString(params[:end])

		trip = Trip.create(
			nickname: params[:nickname], 
			destination: params[:destination], 
			start: Time.new(start_datetime[0], start_datetime[1], start_datetime[2]), 
			end_date: Time.new(end_date[0], end_date[1], end_date[2]), 
			user_id: params[:user_id], 
			image: params[:image])

		serialize_data(trip)
	end

	def update
		trip = Trip.find(params[:id])

		start_datetime = Trip.parseDateString(params[:start])
		end_date = Trip.parseDateString(params[:end])

		trip.nickname = params[:nickname]
		trip.destination = params[:destination]
		trip.start_datetime = Time.new(start_datetime[0], start_datetime[1], start_datetime[2]) 
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