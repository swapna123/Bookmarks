class BookmarksController < ApplicationController

 def index
  @bookmarks = Bookmark.all
  end

def new 
 @bookmark = Bookmark.new
end

def create
@bookmark = Bookmark.new(params[:bookmark])
    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to(@bookmark, :notice => 'Update was successfully created.') }
       else
        format.html { render :action => "new" }
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
        format.html { redirect_to(bookmarks_path, :notice => 'Update was successfully updated.') }
     else
        format.html { render :action => "edit" }
    end
  end
end

def destroy
@bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
 redirect_to bookmarks_path
end

end
