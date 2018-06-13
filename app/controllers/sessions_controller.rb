class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log user in and render user page
    else
      flash.now[:danger] = "Invalid Email/Password Combination."
      render "new"
    end
  end

  def destroy
  end
end
