class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @journals = @user.journals.paginate(page: params[:page], per_page: 9)
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: 'User updated!'
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url, notice: 'User deleted!'
  end

  private

    def user_params
      params.require(:user).permit(
        :name, :email, :password, :password_confirmation)
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
