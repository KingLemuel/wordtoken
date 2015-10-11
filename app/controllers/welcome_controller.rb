class WelcomeController < ApplicationController
	before_action :update_last_seen
	
  def home
  	@user = current_user
  end
end
