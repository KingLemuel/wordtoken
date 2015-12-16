require 'rails_helper'

describe User do 
	before do 
		@user = User.new(name: "example", email: "example@example.com",
							password: "foobar", password_confirmation: "foobar")
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:active_connections) }
	it { should respond_to(:passive_connections) }
	it { should respond_to(:requests) }
	it { should respond_to(:inverse_requests) }
	it { should respond_to(:handshakes) }
	it { should respond_to(:inverse_handshakes) }
	it { should respond_to(:credibility_systems) }
	it { should respond_to(:give_token) }
	it { should respond_to(:ungive_token) }
	it { should respond_to(:given?) }
	it { should respond_to(:request_handshake) }
	it { should respond_to(:cancel_handshake) }
	it { should respond_to(:accept_handshake) }
	it { should respond_to(:shook_hands?) }
	it { should respond_to(:made_requests?) }
	it { should respond_to(:give_credibility) }

	it { should be_valid }

	describe "when name field is empty" do
		before { @user.name = " "}
		it { should_not be_valid }
	end

	describe "when email field is empty" do 
		before { @user.email = " "}
		it { should_not be_valid }
	end

	describe "when password is empty" do 
		before do 
			@user = User.new(password: " ", password_confirmation: " ")
		end
		it { should_not be_valid }
	end

	describe "when password is less than 6 characters" do 
		before do 
			@user = User.new(password: "lesss", password_confirmation: "lesss")
		end
		it { should_not be_valid }
	end
end



