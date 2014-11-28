class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      do_login(user)
      redirect_to user_url(user), notice: 'Login Successfully'
    else
      redirect_to login_url, alert: 'Invalid Email / Password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged Out Successfully'
  end
end
