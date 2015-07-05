class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_parems)
		if @user.save
			redirect_to root_url, :notice => "Sign up!!"
		else
			render "new"
		end
	end
	private
	def user_parems
		params.require(:user).permit(:email, :password, :password_confirmation, :note)
	end
end
