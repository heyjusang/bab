class UserController < ApplicationController
    skip_before_filter :check_login
    def new
        @user = User.new
    end

    def create
        user = User.new(params[:user])

        if user.save
            session[:user_id] = user.id
            redirect_to "/bab/index", :notice => "welcome"

        else
            redirect_to :back, :notice => "dd"
        end
    end

    def login
        user = User.first(:conditions => {:username => params[:user][:username]})

        if user.nil?
            redirect_to :back, :notice => "dd"
            

        else
            if user.password == params[:user][:password]
                session[:user_id] = user.id
                redirect_to "/bab/index"
                
            else
                redirect_to :back, :notice => "dd"
          
            end
        end
    end

    def logout
       session[:user_id] = nil
       redirect_to "/bab/index"
    end


end
