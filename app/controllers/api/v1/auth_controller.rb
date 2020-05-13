class Api::V1::AuthController < ApplicationController

	def create
		user = User.find_by(username: params[:username])

		# isUserFound?
		if user
			
			# canUserBeAuthenticated?
			if user.authenticate(params[:password])
				
				# setUserToken
				token = encode({ user_id: user.id })

				# renderSerializedUserData
				render json: {
					currentUser: user.to_json(
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

	def resolveToken
        token = request.headers["Authentication"]
        payload = decode(token)
        
        user = User.find(payload["user_id"])
        render json: user.to_json(
            except: [:password_digest, :updated_at, :created_at]
        )
    end
    
end
