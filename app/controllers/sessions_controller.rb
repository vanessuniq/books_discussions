class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Welcome back #{user.username}!"
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password combination. Please try again or sign up below if not a member."
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
