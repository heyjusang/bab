class Admin::AdminController < ApplicationController
  
  skip_before_filter :require_login
  before_filter :is_admin?

  layout 'admin'

   





  protected
  def init_session(admin_id)
    session[:admin] = admin_id
  end

  def is_admin?
    if session[:admin].nil?
      flash[:warning] = "Login first"
      redirect_to admin_login_path
      false
    else
      true
    end
  end
end
