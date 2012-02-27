#encoding = UTF-8
class UserController < ApplicationController
    skip_before_filter :require_login, :except => [:change_passwd, :update_passwd]
    skip_before_filter :check_login
    def new
        @user = User.new
    end

    def create
        params[:user][:password] = Digest::SHA256.hexdigest(params[:user][:password])
        params[:user][:password_confirmation] = Digest::SHA256.hexdigest(params[:user][:password_confirmation])
        params[:user][:authorize_token]  = Digest::SHA256.hexdigest(Time.now.to_s+rand().to_s)
        params[:user][:authorized] = false
        params[:user][:mailcheck] = false
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
            redirect_to "/", :notice => "스누메일에 접속하여 인증해 주세요. 서버가 느려서 늦게 갈 수도 있어요..^^;"

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
    def change_passwd
      render :layout => false
    end
    def update_passwd
      user = User.find(session[:user_id])
      params[:user][:now_passwd] = Digest::SHA256.hexdigest(params[:user][:now_passwd])
      params[:user][:want_passwd] = Digest::SHA256.hexdigest(params[:user][:want_passwd])
      params[:user][:want_passwd_re] = Digest::SHA256.hexdigest(params[:user][:want_passwd_re])
      if user.password == params[:user][:now_passwd]
        if params[:user][:want_passwd] == params[:user][:want_passwd_re]
          user.password = params[:user][:want_passwd]
          user.save
          redirect_to "/", :notice => "비밀번호가 성공적으로 변경되었습니다."
        else
          redirect_to :back, :notice => "비밀번호 변경 실패!"
        end
      else
        redirect_to :back, :notice => "비밀번호 변경 실패!"
      end

    end
    def find_passwd
      render :layout => false
    end
    
    def send_passwd
      user = User.where('username = ?', params[:user][:username]).first
      if user.nil?
        redirect_to "/", :notice => "없는 아이디입니다."
      else
        if user.mailname == params[:user][:mailname]
          new_passwd = (0...15).map{ ('a'..'z').to_a[rand(26)] }.join
          user.authorize_token = new_passwd
          user.password = Digest::SHA256.hexdigest(new_passwd)
          user.mailcheck = false
          user.save
          redirect_to "/", :notice => "새 비밀번호가 메일로 보내졌습니다. 아마 곧."
        else
          redirect_to :back, :notice => "아이디와 메일이 일치하지 않습니다."
        end
      end
    end
end
