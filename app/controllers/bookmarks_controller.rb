class BookmarksController < ApplicationController
 
  before_filter :check_session_user

 def index
  @bookmarks = Bookmark.paginate(:page => params[:page], :per_page => 4)
  
  end

def new 
 @bookmark = Bookmark.new
end

def create
 @user = User.find(session[:user])
 @bookmark=Bookmark.new(:title => params[:bookmark][:title],:description => params[:bookmark][:description],:user_id => @user.id)
    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to users_path, :notice => 'Bookmark was successfully created.' }
       else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
     end
  end
end

def show
  @bookmark = Bookmark.find(params[:id])
end

def edit
 @bookmark = Bookmark.find(params[:id])
end
def update
 @bookmark = Bookmark.find(params[:id])
 respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to(users_path, :notice => 'Bookmark was successfully updated.') }
     else
        format.html { render :action => "edit" }
    end
  end
end

def destroy
  @bookmark = Bookmark.find(params[:id])
     @bookmark.destroy
 redirect_to users_path
end

end
