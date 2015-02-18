class UsersController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]
	def new
		@user = User.new
		@current_user = current_user
	end

	def create
		#up = user_params
		#up.delete :password_confirmation
		@user = User.new user_params
		@current_user = current_user
		if @user.save
			redirect_to root_url
		else
			render action: :new
		end
	end

	def show
		@user = User.find params[:id]
	end

	private

	def user_params
		params.require(:user).permit :name, :password, :password_confirmation
	end
end
