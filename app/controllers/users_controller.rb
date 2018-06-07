class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.friendly.find(params[:id])
  end
end
