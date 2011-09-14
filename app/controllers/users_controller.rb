class UsersController < ApplicationController
 
  before_filter :check_session

 def index
   
   @users = User.paginate(:page => params[:page], :per_page => 4)
  end

  def new
   @user = User.new
  end

  def create
    if (params[:user][:password] == params[:confirmpassword]) 

         @user=User.new(:name => params[:user][:name],:emailid => params[:user][:emailid],:password => params[:user][:password]) 



        respond_to do |format|
         if @user.save
            format.html { redirect_to users_path }
     flash[:notice] = "User Saved Successfully"
        else
            format.html{render :action => "new"}
      flash[:error] = "User failed to Save"
format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
       end
    end
   else
       redirect_to users_path
  end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_path, :notice => 'Update was successfully updated.') }
     else
        format.html { render :action => "edit" }
    end
  end
  end

  def destroy
   @user = User.find(params[:id])
    @user.destroy
 redirect_to users_path
  end
  

end
