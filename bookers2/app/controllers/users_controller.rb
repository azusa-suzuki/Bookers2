class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_current_user, only: [:edit, :update]

	def show
		@user = User.find(params[:id])
		@users = User.all
		@book = Book.new
		@books = @user.books
	end

	def edit
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
		@user = User.find(current_user.id)
		@book = Book.new
	end

	def update
  	@user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
      else
        render :edit
      end
	end

	private

	def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
	end
	def check_current_user
	    user = User.find(params[:id])
      if user != current_user
        redirect_to user_path(current_user.id)
      end
	end
end