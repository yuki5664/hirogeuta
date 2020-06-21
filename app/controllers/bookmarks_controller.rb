class BookmarksController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    bookmark = current_user.bookmarks.build(micropost_id: params[:micropost_id])
    bookmark.save!
  end

  def destroy
    current_user.bookmarks.find_by(micropost_id: params[:micropost_id]).destroy!
  end

  private

  def set_post
    @post = Micropost.find(params[:micropost_id])
  end

end
