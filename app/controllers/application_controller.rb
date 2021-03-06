class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    private

    # confirms user is logged in
  def require_login
    unless logged_in?
      # store requested url
      requested_url
      flash[:danger] = 'Please login to access the page or post a discussion'
      redirect_to login_path
    end
  end

  # confirm admin
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
