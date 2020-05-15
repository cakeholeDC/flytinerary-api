class EventsController < ApplicationController

	def index
		events = Event.all
		render json: events.to_json(
				except: [:updated_at, :created_at, :trip_id],
				# include: [users: { except: [:password_digest, :updated_at, :created_at, :age, :username] }]
			)
	end

	def show
		event = Event.find(params[:id])

		render json: event.to_json(
				except: [:user_id, :updated_at, :created_at],

				# include: [
				# 	user_name: { only: :name},
				# 	trip: {
				# 		except: [:user_id, :updated_at, :created_at],
				# 		include: [organizer: { only: :name}]
				# 		}
				# ]
			)
	end

	def create
		# eventStart = Event.parseDateTimeString(params[:start])
		# eventEnd = Event.parseDateTimeString(params[:end])
		# byebug
		newEvent = Event.create(
			title: params[:title],
			start: DateTime.parse(params[:start]),
			end: DateTime.parse(params[:end]),
			all_day: params[:all_day],
			location: params[:location],
			latitude: params[:latitude],
			longitude: params[:longitude],
			company_agency: params[:company_agency],
			reservation_number: params[:reservation_number],
			notes: params[:notes],
			trip_id: params[:trip],
			category_id: params[:category],
			user_id: params[:user],
		)
		
		render json: newEvent
	end

	def destroy
		Event.destroy(params[:id])
	end

end