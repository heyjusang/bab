class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_login

  private
  def check_login
        if !session[:user_id].nil? 
            @current_user = User.find(session[:user_id])
        end

  end


end
