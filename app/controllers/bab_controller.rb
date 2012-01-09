class BabController < ApplicationController

    def index
        if !session[:user_id].nil? 
            @current_user = User.find(session[:user_id])
        end
    end



end
