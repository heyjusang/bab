#encoding = UTF-8
class UserController < ApplicationController
    skip_before_filter :require_login
    skip_before_filter :check_login
    def new
        @user = User.new
    end

    def create
        params[:user][:password] = Digest::SHA256.hexdigest(params[:user][:password])
        params[:user][:password_confirmation] = Digest::SHA256.hexdigest(params[:user][:password_confirmation])
        params[:user][:authorize_token]  = Digest::SHA256.hexdigest(Time.now.to_s+rand().to_s)
        params[:user][:authorized] = false
        user = User.new(params[:user])
        if User.first(:conditions => {:username => params[:user][:username]})
          redirect_to "/", :notice => "이미 있는 아이디 입니다."
        elsif User.first(:conditions => {:mailname => params[:user][:mailname]})
          redirect_to "/", :notice => "이미 사용된 메일 입니다."
        elsif params[:user][:password_confirmation] != params[:user][:password] 
          redirect_to "/", :notice => "비밀번호가 다릅니다."
        elsif (params[:user][:username].length < 3 || params[:user][:username].length > 15)
          redirect_to "/", :notice => "아이디는 3자이상,15자이하만 가능합니다."
        elsif params[:user][:username].match(/\A(^[a-zA-Z0-9]+$)\z/i).nil?
          redirect_to "/", :notice => "아이디는 영어,숫자만 가능합니다." 
        end


        if user.save
           AuthorityMailer.confirm_email(user).deliver
            redirect_to "/", :notice => "스누메일에 접속하여 인증해 주세요."

        end
    end

    def login
        params[:user][:password] = Digest::SHA256.hexdigest(params[:user][:password])
        user = User.first(:conditions => {:username => params[:user][:username]})

        if user.nil?
            redirect_to :back, :notice => "없는 회원입니다."
            

        else
            if user.password == params[:user][:password]
              if user.authorized == true
                session[:user_id] = user.id
                redirect_to "/"
              else
                redirect_to "/", :notice => "스누메일에 접속하여 인증해 주세요."
              end
                
            else
                redirect_to :back, :notice => "비밀번호가 틀렸습니다."
          
            end
        end
    end

    def logout
       session[:user_id] = nil
       redirect_to "/"
    end


end
