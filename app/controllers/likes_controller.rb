class LikesController < ApplicationController
  before_action :set_post

  def like
    like = current_user.likes.new(micropost_id: @post.id)
    like.save
    redirect_to root_url
  end

  def unlike
    like = current_user.likes.find_by(micropost_id: @post.id)
    like.destroy
    redirect_to root_url
  end

  private

  def set_post
    @post = Micropost.find(params[:post_id])
  end

end
