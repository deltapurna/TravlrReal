class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def do_login(user)
    session[:user_id] = user.id unless session[:user_id]
  end

  def logged_in_user
    redirect_to login_url,
      alert: 'Please login to access the page' unless current_user
  end

  def correct_user
    redirect_to root_url,
      alert: 'You are not authorized to do the action' unless params[:id].to_i == session[:user_id]
  end
end
