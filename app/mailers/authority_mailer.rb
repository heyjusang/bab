#encoding = UTF-8
class AuthorityMailer < ActionMailer::Base
  default :from => "Babtong@babtong.com"


  def confirm_email(user)
    @user = user
    @url = "http://co9901.cafe24.com:9902/authorize/confirm?user=#{@user.username}&authorized_token=#{@user.authorize_token}"
    mail(:to => "#{user.mailname}@snu.ac.kr", :subject => "밥통 인증 메일")
  end

end
