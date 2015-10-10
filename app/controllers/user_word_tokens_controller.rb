class UserWordTokensController < ApplicationController
	before_action :signed_in_user

	# Should be called TransferTokens controller - and TransferToken Model #

	#create transfer
	def create
		# @word_tokens = Iterate over and find tokens, pass them into array
		# create multiple relations with each user for every token

		# @word_tokens.each do |token|
			#current_user.give_token(@user, token)
		# end

		binding.pry

		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end
end
