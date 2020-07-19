module SessionsHelper
    # logs in a user
    def log_in(user)
        session[:user_id] = user.id
    end

    # retrieve logged in user if any
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # check if current user
    def is_current_user?(user)
        user == current_user
    end

    # check if user is looged in
    def logged_in?
        !!session[:user_id]
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    # store url trying to be accessed
    def requested_url
        session[:forwarding_url] = request.url if request.get?
    end

    # redirect to requested url after authorized or to default
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end

    
end
