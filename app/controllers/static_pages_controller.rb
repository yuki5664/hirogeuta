class StaticPagesController < ApplicationController
  def home
    @posts = Micropost.all.page(params[:page]).per(9)
  end

  def about
  end
end
