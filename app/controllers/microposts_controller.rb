class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @q = Micropost.ransack(params[:q])
    @posts = @q.result.all.page(params[:page]).per(9)
  end
  
  def new
    @post = Micropost.new
  end

  def show
    @post = Micropost.find(params[:id])
  end

  def create
    @post = current_user.microposts.build(micropost_params)
    #追記した部分ここから
    url = params[:micropost][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    #ここまで

    if @post.save
      flash[:success] = "投稿されました！"
      redirect_to root_url
    else
      render :new
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = "削除されました！"
    redirect_to root_url
  end



  private

    def micropost_params
      params.require(:micropost).permit(:artist, :song, :youtube_url, :content)
    end

    def correct_user
      @post = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end
