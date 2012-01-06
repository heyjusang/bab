class UserController < ApplicationController

    def new
        @user = User.new
        @note = flash[:notice]
    end

    def create
        user = User.new(params[:user])

        if user.save
            session[:user_id] = user.id
            
            flash[:notice] = " "

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
                
            else
                redirect_to :back
                flash[:notice] = " "
            end
        end
    end


end
