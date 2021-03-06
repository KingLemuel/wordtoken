class HandshakesController < ApplicationController
	before_action :update_last_seen

	def create 
		# binding.pry
		@user = User.find(params[:connection_id])
		current_user.accept_handshake @user
		respond_to do |format|
			format.html { redirect_to current_user}
			format.js
		end
	end
end
