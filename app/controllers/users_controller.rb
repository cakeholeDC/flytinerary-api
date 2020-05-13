class UserController < ApplicationController

	def index 
		users = Users.all
		render json: users.to_json(
			except: [:updated_at, :created_at],
			include: [:trips, :events] 
			)
	end

	def show 
		user = User.find(params[:id])
		render json: user.to_json(
			except: [:updated_at, :created_at],
			include: [:trips, :events] 
			)
	end

	def trips 
		user = User.find(params[:id])
		trips = user.trips.sort_by { |event| event.start_datetime }
		render json: trips.to_json(
			except: [:updated_at, :created_at, :user_id],
			include: [
				organizer: { except: [:password_digest, :updated_at, :created_at, :age] },
				attendees: {except: [:created_at, :updated_at, :password_digest, :age]},
				event_timeline: { 
					except: [:updated_at, :created_at, :trip_id],
					include: [users: { except: [:password_digest, :updated_at, :created_at, :age] }] }
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

		render json: user.to_json(
			except: [:updated_at, :created_at]
			)
	end
end
