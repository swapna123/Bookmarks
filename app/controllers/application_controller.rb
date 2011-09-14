class ApplicationController < ActionController::Base
  protect_from_forgery

def check_session
    puts 'sssssssssss' , session[:user]
    if session[:user].nil?
      flash[:error] = "You are not authenticated"
     redirect_to home_index_path
    end
end
end
