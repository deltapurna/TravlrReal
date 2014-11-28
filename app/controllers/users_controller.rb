class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # render json: params[:user] and return
    @user = User.new(user_params)
    if @user.save
      do_login(@user)
      redirect_to user_url(@user), notice: 'User created!'
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :name, :email, :password, :password_confirmation)
    end
end
