#encoding = UTF-8
class AuthorizeController < ApplicationController
    skip_before_filter :check_login
    skip_before_filter :require_login
def confirm
    user = User.where("username = ?", params[:user]).first
  
  if (user.authorize_token == params[:authorized_token])
    user.authorized = true
    user.save
    session[:user_id] = user.id 
    redirect_to "/", :notice => "인증 성공"
  else
    redirect_to "/", :notice => "인증 실패"
  end



end




end
