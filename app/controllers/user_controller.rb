class UserController < ApplicationController

    def new
        @user = User.new
        @note = flash[:notice]
    end

    def create
        user = User.new(params[:user])

        if user.save
            session[:user_id] = user.id
            redirect_to "/bab/index"
            flash[:notice] = "welcome!"

        else
            flash[:notice] = " "
            redirect_to :back
        end
    end

    def login
        user = User.first(:conditions => {:username => params[:user][:username]})

        if user.nil?
            redirect_to :back
            flash[:notice] = " "

        else
            if user.password == params[:user][:password]
                session[:user_id] = user.id
                redirect_to "/bab/index"
                
            else
                redirect_to :back
                flash[:notice] = " "
            end
        end
    end

    def logout
       session[:user_id] = nil
       redirect_to "/bab/index"
    end


end
