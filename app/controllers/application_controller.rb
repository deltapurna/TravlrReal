class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def do_login(user)
    session[:user_id] = user.id unless session[:user_id]
  end
end
