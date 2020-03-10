class TripsController < ApplicationController

	def index
		trips = Trip.all.sort_by { |trip| trip.start_datetime }
		# render json: trips.to_json(
		# 		except: [:traveler_id, :updated_at, :created_at],
		# 		include: [
		# 			organizer: { only: :name} ,
		# 			attendees: {except: [:created_at, :updated_at]},
		# 			event_timeline: { except: [:created_at, :updated_at] } 
		# 		]
		# 	)
		serialize_data(trips)
	end
	
	def show
		trip = Trip.find(params[:id])
		serialize_data(trip)
	end

	def create

		start_datetime = Trip.parseDateString(params[:start_datetime])
		end_date = Trip.parseDateString(params[:end_date])

		trip = Trip.create(
			nickname: params[:nickname], 
			destination: params[:destination], 
			start_datetime: Time.new(start_datetime[0], start_datetime[1], start_datetime[2]), 
			end_date: Time.new(end_date[0], end_date[1], end_date[2]), 
			traveler_id: params[:traveler_id], 
			image: params[:image])

		serialize_data(trip)
	end

	def update
		trip = Trip.find(params[:id])

		start_datetime = Trip.parseDateString(params[:start_datetime])
		end_date = Trip.parseDateString(params[:end_date])

		trip.nickname = params[:nickname]
		trip.destination = params[:destination]
		trip.start_datetime = Time.new(start_datetime[0], start_datetime[1], start_datetime[2]) 
		trip.end_date = Time.new(end_date[0], end_date[1], end_date[2])
		trip.traveler_id = params[:traveler_id]
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
			except: [:traveler_id, :updated_at, :created_at],
			include: [
				organizer: {except: [:created_at, :updated_at, :age, :gender]} ,
				attendees: {except: [:created_at, :updated_at]},
				event_timeline: { except: [:created_at, :updated_at, :trip_id] } 
			]
		)
	end

end