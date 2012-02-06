class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login
  before_filter :check_login

  private

  def require_login
    unless logged_in?
    
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def check_login
    if !session[:user_id].nil?
      @current_user = User.find(session[:user_id])
    end
  end

end
