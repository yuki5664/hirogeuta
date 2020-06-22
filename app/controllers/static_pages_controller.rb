class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:home]

  def home
    @q = Micropost.ransack(params[:q])
    @posts = @q.result.all.page(params[:page]).per(9)
  end

  def about
  end


end
