class User < ActiveRecord::Base
	attr_accessor :password
	before_save :encrypt_password
	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email
	
	def self.authenticate(user_params)
		user = find_by_email(user_params[:email])
		if user && user.password_hash == BCrypt::Engine.hash_secret(user_params[:password], user.password_salt)
			user
		else
			nil
		end
	end
	
	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(user_params)
		end
	end
	private
	def user_params
		params.permit(:email, :password)
	end
end
