class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :require_login

    private
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
       redirect_to '/' if !logged_in?
    end

    def require_login
        if !logged_in?
            flash[:message] = "You need to Log In to view this page" 
            redirect_to '/' 
        end
    end
end
