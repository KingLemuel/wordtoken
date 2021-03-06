class UserWordTokensController < ApplicationController
	before_action :update_last_seen
	# before_action :signed_in_user

	# Should be called TransferTokens controller - and TransferToken Model #

	#create transfer
	def create
		 @user = User.find(params[:connection_id].to_i)

		 @word_tokens = params[:Tokens].keys.map {|k| WordToken.find_by(label: k)}
		 @word_tokens.each do |token|
			 current_user.give_token(@user, token)
			 current_user.give_credibility(@user)
		 end

		respond_to do |format|
			format.html { redirect_to @user}
			format.js 
		end
	end
end
