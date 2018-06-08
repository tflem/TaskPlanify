class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[user_params])
    if @user.save
      # render successful flash message
    else
      render 'new'
    end
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
