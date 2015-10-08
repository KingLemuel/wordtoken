class User < ActiveRecord::Base
	# Devise

	devise :database_authenticatable, :registerable, :recoverable,
	:rememberable, :trackable, :validatable

	# Word Token - User Relations
	has_many :active_connections, class_name: "UserWordToken",
							foreign_key: "giver_id",
							dependent: :destroy

	has_many :passive_connections, class_name: "UserWordToken",
							   foreign_key: "receiver_id",
							   dependent: :destroy

	has_many :tokens_given, through: :active_connections, source: :giver
	has_many :tokens_received, through: :passive_connections, source: :receiver

	# Handshake - User - Relations
	#Handshake Relationship
	has_many :handshakes
	has_many :connections, :through => :handshakes
	has_many :inverse_handshakes, :class_name => "Handshake", :foreign_key => "connection_id"
	has_many :inverse_connections, :through => :inverse_handshakes, :source => :user

	

	# give another user a token
	 def give_token(other_user, word_token)
		active_connections.create(receiver_id: other_user.id, word_token_id: word_token.id)
	 end

	 # take token back 
	def ungive_token(other_user)
	 	active_connections.find_by(receiver_id: other_user.id).destroy
	end

	def given?(other_user)
		tokens_given.include? other_user
	end


	# def request_handshake(other_user)
	# end

	# def unrequest_handshake(other_user)
	# end

	# def handshaked?(other_user)
	# end
	
	# Set up accessible (or protected) attributes for your model
	# def user_params
	# 	params.require(:user).permit(:email, :password, :password_confirmation)
	# end

end
