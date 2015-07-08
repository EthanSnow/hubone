class UsersController < ApplicationController
	require 'pusher'
	Pusher.app_id = '127473'
	Pusher.key = 'b3551f312ec0f4d6ee1f'
	Pusher.secret = '28e76117d11d866ef5e1'
	
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_parems)
		if @user.save
			result = UserMailer.signup_confirmation(@user).deliver
			redirect_to root_url, :notice => "Sign up!!#{result}"  
		else
			render "new"
		end
	end
	private
	def user_parems
		params.require(:user).permit(:email, :password, :password_confirmation, :note)
	end
end
