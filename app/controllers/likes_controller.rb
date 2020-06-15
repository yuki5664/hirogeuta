class LikesController < ApplicationController
  before_action :set_post

  def like
    like = current_user.likes.new(micropost_id: @post.id)
    like.save
      
  end

  def unlike
    like = current_user.likes.find_by(micropost_id: @post.id)
    like.destroy
    
  end

  private

  def set_post
    @post = Micropost.find(params[:post_id])
  end

end
