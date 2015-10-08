class UserWordToken < ActiveRecord::Base
	belongs_to :receiver, class_name: "User"
	belongs_to :giver, class_name: "User"
	belongs_to :word_token

	validates :receiver_id, presence: true
	validates :giver_id,    presence: true
	validates :word_token_id, presence: true
end
