class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "メール認証が完了しました。ようこそヒロゲウタへ!"
      redirect_to user
    else
      flash[:danger] = "メール認証のリンクが有効ではありません"
      redirect_to root_url
    end
  end
  
end
