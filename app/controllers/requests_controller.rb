class RequestsController < ApplicationController
	# before_action :signed_in_user


	def create
		# binding.pry
		@user = User.find(params[:connection_id])

		current_user.requests.create(connection_id: @user.id)
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end

	
	end

	def destroy
		@user = User.find(params[:connection_id])
		current_user.cancel_request @user
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end

end
