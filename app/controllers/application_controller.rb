class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_search
  def set_search
    @q = Micropost.ransack(params[:q])
    @posts = @q.result.all.page(params[:page]).per(9)
  end

  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end

end
