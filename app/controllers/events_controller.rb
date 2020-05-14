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

	def update
		# updateEvent = Event.find(params[:id])

		# start_date = Event.parseDateTimeString(params[:start])
		# end_date = Event.parseDateTimeString(params[:end])

		# updateEvent.event_type = params[:event_type]
		# updateEvent.description = params[:description]
		# updateEvent.start = Time.new(start_date[0], start_date[1], start_date[2], start_date[3], start_date[4])
		# updateEvent.end = Time.new(end_date[0], end_date[1], end_date[2], end_date[3], end_date[4])
		# updateEvent.save

		# render json: updateEvent.to_json(
		# 		except: [:user_id, :updated_at, :created_at],

		# 		include: [
		# 			user_name: { only: :name},
		# 			trip: {
		# 				except: [:user_id, :updated_at, :created_at],
		# 				include: [organizer: { only: :name}]
		# 				}
		# 		]
		# 	)
	end

	def create
		start_datetime = Event.parseDateTimeString(params[:start]).join(',')
		end_datetime = Event.parseDateTimeString(params[:end]).join(',')
		
		newEvent = Event.create(
			title: params[:title],
			start: Time.new(start_datetime),
			end: Time.new(end_datetime),
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