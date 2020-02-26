class TravelersController < ApplicationController

	def index 
		travelers = Traveler.all
		render json: travelers.to_json(
			except: [:updated_at, :created_at]
			)
	end

	def show 
		traveler = Traveler.find(params[:id])
		render json: traveler.to_json(
			except: [:updated_at, :created_at]
			)
	end

	def create
		traveler = Traveler.create(
			name: params[:name],
			age: params[:age],
			gender: params[:gender])

		render json: traveler.to_json(
			except: [:updated_at, :created_at]
			)
	end
end
