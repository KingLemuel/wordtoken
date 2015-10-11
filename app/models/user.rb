class User < ActiveRecord::Base

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
	has_many :hand_connections, :through => :handshakes
	has_many :inverse_handshakes, :class_name => "Handshake", :foreign_key => "connection_id"
	has_many :inverse_hand_connections, :through => :inverse_handshakes, :source => :user

	# Request - Relations
	has_many :requests
	has_many :req_connections, :through => :requests
	has_many :inverse_requests, :class_name => "Request", :foreign_key => "connection_id"
	has_many :inverse_req_connections, :through => :inverse_requests, :source => :user

	# Validations 
	validates :name,  presence: true, length: { maximum: 30 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                    format: { with: VALID_EMAIL_REGEX },
	                    uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }

	has_secure_password

	# # solr
	# searchable do 
	# 	text :name
	# end


	def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	end

	

	# give another user a token
	 def give_token(other_user, word_token)
		active_connections.create(receiver_id: other_user.id, word_token_id: word_token.id)
	 end

	 # take token back 
	def ungive_token(other_user)
	 	active_connections.find_by(receiver_id: other_user.id).destroy
	end

	def given?(other_user, word_token)
		#iterate over given tokens
		#determine if token exist
		#return true
		active_connections.select { |l| 
			l.receiver == other_user && l.word_token.label == word_token.label 
		 }.size > 0
	end


	 def request_handshake(other_user)
	 	requests.create(connection_id: other_user.id)
	 end

	 def cancel_request(other_user)
	 	inverse_requests.find_by(user_id: other_user.id).destroy
     end

     def accept_handshake(other_user)
     	handshakes.create(connection_id: other_user.id)
     	cancel_request other_user
     end



	 def shook_hands?(other_user)
	 	handshakes.find_by(connection_id: other_user.id) || inverse_handshakes.find_by(user_id: other_user.id)
	 end
	
	# Set up accessible (or protected) attributes for your model
    def user_params
	 params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
