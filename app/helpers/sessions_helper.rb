module SessionsHelper
    # logs in a user
    def log_in(user)
        session[:user_id] = user.id
    end

    # retrieve logged in user if any
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # check if user is looged in
    def logged_in?
        !!session[:user_id]
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
