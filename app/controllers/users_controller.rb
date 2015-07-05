class UsersController < ApplicationController
  def new
		@user = User.new
	end
	def create
		@user = User.new(params[:typicaluser])
		if @typicaluser.save
			redirect_to root_url, :notice => "Sign up!!"
		else
			render "new"
		end
	end
end
