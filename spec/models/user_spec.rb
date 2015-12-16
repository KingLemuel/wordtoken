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
end



