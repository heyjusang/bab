#encoding = UTF-8
class AuthorityMailer < ActionMailer::Base
  default :from => "Baptong@baptong.com"


  def confirm_email(user)
    @user = user
    @url = "http://co9901.cafe24.com/authorize/confirm?user=#{@user.username}&authorized_token=#{@user.authorize_token}"
    mail(:to => "#{user.mailname}@snu.ac.kr", :subject => "밥통 인증 메일")
  end
  
  def change_passwd_email(user)
    @user = user
    mail(:to => "#{user.mailname}@snu.ac.kr", :subject => "밥통 새 비밀번호")
  end


end
