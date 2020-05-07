class TravelersController < ApplicationController

	def index 
		travelers = Traveler.all
		render json: travelers.to_json(
			except: [:updated_at, :created_at],
			include: [:trips, :events] 
			)
	end

	def show 
		traveler = Traveler.find(params[:id])
		render json: traveler.to_json(
			except: [:updated_at, :created_at],
			include: [:trips, :events] 
			)
	end

	def trips 
		traveler = Traveler.find(params[:id])
		render json: traveler.trips.to_json(
			except: [:updated_at, :created_at, :traveler_id],
			include: [
				organizer: { except: [:password_digest, :updated_at, :created_at, :age, :username] },
				event_timeline: { 
					except: [:updated_at, :created_at, :trip_id],
					include: [travelers: { except: [:password_digest, :updated_at, :created_at, :age, :username] }] }
			 ]
			)
	end

	def create
		traveler = Traveler.create(
			first_name: params[:first_name],
			last_name: params[:last_name],
			username:params[:username],
			age: params[:age],
			password: params[:password])

		render json: traveler.to_json(
			except: [:updated_at, :created_at]
			)
	end
end
