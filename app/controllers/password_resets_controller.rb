class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.set_reset_password_token
      UserMailer.password_reset(@user.id).deliver
      redirect_to root_url, notice: 'Please check your email'
    else
      redirect_to root_url, alert: 'Email not found'
    end
  end

  def edit
    @user = User.find_by(reset_password_token: params[:token])
    redirect_to root_url, alert: 'Invalid Token' unless @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to login_url, notice: 'Please login with your new password'
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
