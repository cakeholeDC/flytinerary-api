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
		byebug
		render json: traveler.trips.to_json(
			except: [:updated_at, :created_at],
			include: [organizer: { except: [:password_digest, :updated_at, :created_at] } ]
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
