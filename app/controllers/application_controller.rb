class ApplicationController < ActionController::Base
  protect_from_forgery

def check_session_user
        if session[:user].nil?
      flash[:error] = "You are not authenticated"
     redirect_to home_index_path
    end
 end
 
 def check_session_admin
    if session[:admin].nil?
      flash[:error] = "You are not authenticated"
     redirect_to home_index_path
    end
 end
end
