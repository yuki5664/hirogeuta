class StaticPagesController < ApplicationController

  def home
    @q = Micropost.ransack(params[:q])
    @posts = @q.result.all.page(params[:page]).per(9)
    # 採用者様ログインページを作成するとき
    # @user = User.new
    # unless log_in(@user)
    #   redirect_to login_url
    # end
  end

  def about
  end
end
