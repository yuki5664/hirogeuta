class StaticPagesController < ApplicationController
  def home
    @q = Micropost.ransack(params[:q])
    @posts = @q.result.all.page(params[:page]).per(9)
  end

  def about
  end
end
