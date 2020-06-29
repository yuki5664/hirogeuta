class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @post = @comment.micropost
    if @comment.save
      @post.create_notification_comment!(current_user, @comment.id)
      flash[:success] = "コメントされました！"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '空の投稿 or 140文字以上のため投稿されませんでした'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "コメントを削除しました"
    redirect_back(fallback_location: root_path)    
  end


  private
  def comment_params
    params.require(:comment).permit(:body, :micropost_id)
  end

end
