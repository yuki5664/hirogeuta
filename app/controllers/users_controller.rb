class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :corrent_user, only: [:show, :edit, :update]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.microposts.page(params[:page]).per(9)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールが更新されました！"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "アカウントが削除されました！"
    redirect_to root_url
  end


  private


    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation, :avatar)
    end

    # beforeアクション
    
    #正しいユーザーかどうか確認
    def corrent_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
