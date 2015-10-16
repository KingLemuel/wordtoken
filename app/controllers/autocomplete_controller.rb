class AutocompleteController < ApplicationController
  def user_json
  	# binding.pry
  	if (params[:q].size<1)
  		render :json => []
  		return
  	end
  	data = User.where("lower(name) LIKE ?", params[:q].downcase+"%").limit(20).all.map { |user| 
  		{ name: user.name, img_url: gravatar(user), profile_link: user_path(user)}
  	}
  	render :json => data
  end
end

def gravatar(user)
	gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=50"
end
