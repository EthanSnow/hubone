class UsersController < ApplicationController

	
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_parems)
		if @user.save
			
			@mailgun = Mailgun()
			parameters = {
				:to => "ethansnow2012@gmail.com",
				:subject => "missing tps reports",
				:text => "yeah, we're gonna need you to come in on friday...yeah.",
				:from => "ethan@initech.mailgun.domain"
			}

			@mailgun.messages.send_email(parameters)
			
			
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
