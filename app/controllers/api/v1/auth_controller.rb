class Api::V1::AuthController < ApplicationController

	def create
		traveler = Traveler.find_by(username: params[:username])

		# isUserFound?
		if traveler
			
			# canUserBeAuthenticated?
			if traveler.authenticate(params[:password])
				
				# setUserToken
				token = encode({ traveler_id: traveler.id })

				# renderSerializedUserData
				render json: {
					currentUser: traveler.to_json(
				            except: [:updated_at, :created_at],
				            include: [:trips, :events] 
						),
						jwt: token
						}, status: :accepted
			# userExistsWithoutAuth
			else
				render json: {
					error: true,
					message: "Incorrect Password"
					}, status: :unauthorized
			end
		#userDoesNotExist
		else
			render json: {
				error: true,
				message: "Username not found"
				}, status: :not_acceptable
			
		end
	end
end
