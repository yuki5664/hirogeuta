class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(micropost_id: params[:micropost_id])
    bookmark.save!
    redirect_to root_path
  end

  def destroy
    current_user.bookmarks.find_by(micropost_id: params[:micropost_id]).destroy!
    redirect_to root_path
  end

end
