class UsersController < ApplicationController

	def index 
		users = User.all
		serialize_data(users)
	end

	def show 
		user = User.find(params[:id])
		serialize_data(user)
	end

	def trips 
		user = User.find(params[:id])
		trips = user.trips.sort_by { |event| event.start }
		render json: trips.to_json(
			except: [:updated_at, :created_at, :user_id],
			include: [
				organizer: { except: [:password_digest, :updated_at, :created_at] },
				attendees: {except: [:created_at, :updated_at, :password_digest, :age]},
				event_timeline: { 
					except: [:updated_at, :created_at, :trip_id],
					include: [user: { except: [:password_digest, :updated_at, :created_at, :age] }] 
				}
			 ]
			)
	end

	def create
		user = User.create(
			first_name: params[:first_name],
			last_name: params[:last_name],
			username:params[:username],
			age: params[:age],
			password: params[:password]
			)

		serialize_data(user)
	end

	private

	def serialize_data(data)
		render json: data.to_json(
			except: [:updated_at, :created_at, :password_digest],
		)
	end
end
