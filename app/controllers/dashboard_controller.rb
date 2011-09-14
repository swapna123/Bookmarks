class DashboardController < ApplicationController
before_filter :check_session_admin

  def index
  end
  
 def users_index
   @users = User.all
 end
 def users_show
  @user = User.find(params[:id])
 end

end
