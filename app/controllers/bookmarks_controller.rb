class BookmarksController < ApplicationController
  before_action :set_post, only: %i[create destroy]
  before_action :logged_in_user, only: [:show]

  def show
    @user = current_user
    @bookmarks = Bookmark.where(user_id: @user.id).all
    @posts = current_user.bookmark_microposts.all
  end

  def create
    bookmark = current_user.bookmarks.build(micropost_id: params[:micropost_id])
    bookmark.save!
    @post.create_notification_bookmark!(current_user)
  end

  def destroy
    current_user.bookmarks.find_by(micropost_id: params[:micropost_id]).destroy!
  end

  private

  def set_post
    @post = Micropost.find(params[:micropost_id])
  end

end
