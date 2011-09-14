class HomeController < ApplicationController

 #before_filter :check_session

 def index
   @total_bookmarks = Bookmark.all
   @users = User.limit(3)
  end
 def create
   @user = User.new(params[:user])
   @user1 = User.find_all_by_emailid(@user.emailid)
   if(!@user1.blank? && @user1.first.password.eql?(@user.password))
    session[:user] = @user1.first.id
    flash[:notice] = "Logged in Successfully"
    redirect_to user_path
   else
    flash[:error] = "Failed to login"
    redirect_to home_index_path
   end
  end 
 def show
   @user = User.find(params[:id])
    end
  def view_all
   @users=User.all
  end
  def logout
   session[:user] = nil if session[:user]
   flash[:notice] = "Logged out Successfully"
     redirect_to home_index_path
  end
end
