class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Welcome back #{user.username}!"
      redirect_back_or user
    else
      flash.now[:danger] = "Invalid email/password combination. Please try again or sign up below if not a member."
      render :new
    end
  end

  def googleAuth
    
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    if user.persisted?
      log_in(user)
      flash[:success] = "Welcome back #{user.username}!"
      redirect_back_or user
    else
      user.password = "google_auth"
      # Access_token is used to authenticate request made from the rails application to the google server
      user.google_token = access_token.credentials.token
      # Refresh_token to request new access_token
      # Note: Refresh_token is only sent once during the first request
      refresh_token = access_token.credentials.refresh_token
      user.google_refresh_token = refresh_token if refresh_token.present?
      #debugger
      if user.save
        log_in(user)
        
        flash[:success] = "Welcome #{user.username}!"
        redirect_to user
        #redirect_to root_path
      else
        redirect_to login_path
      end
    end
    
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
