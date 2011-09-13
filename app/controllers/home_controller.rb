class HomeController < ApplicationController
 layout 'new' 
 def index
   @total_bookmarks = Bookmark.all
  end
 def create
  @user = User.new(params[:user])
   @user1 = User.find_all_by_emailid(@user.emailid)
   if(!@user1.blank? && @user1.first.password.eql?(@user.password))
    session[:user] = @user1.first.id
    flash[:notice] = "Logged in Successfully"
    redirect_to users_path
   else
    flash[:error] = "Failed to login"
    redirect_to home_index_path
   end
  end 
end
