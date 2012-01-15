class EvaluateController < ApplicationController


    def new_ev
        if  Evaluation.first(:conditions => ['user_id = ? and restaurant_id = ?',session[:user_id],params[:res_id]])
            temp_ev = Evaluation.first(:conditions => ['user_id = ? and restaurant_id = ?',session[:user_id],params[:res_id]])
            restaurant = Restaurant.find(params[:res_id])
            restaurant.count = restaurant.count - 1
            restaurant.tastepoint = restaurant.tastepoint - temp_ev.taste
            restaurant.speedpoint = restaurant.speedpoint - temp_ev.speed
            restaurant.amountpoint = restaurant.amountpoint - temp_ev.amount
            restaurant.servicepoint = restaurant.servicepoint - temp_ev.service
            Evaluation.destroy(temp_ev.id)
            restaurant.save
        end


        @evaluation = Evaluation.new

    end

    def create_ev
        evaluation = Evaluation.new(params[:evaluation])
        restaurant = Restaurant.find(params[:res_id])
        user = User.find(session[:user_id])
        evaluation.restaurant_id = restaurant.id
        evaluation.user_id = user.id


        restaurant.count = restaurant.count + 1
        restaurant.tastepoint = restaurant.tastepoint + evaluation.taste
        restaurant.speedpoint = restaurant.speedpoint + evaluation.speed
        restaurant.amountpoint = restaurant.amountpoint + evaluation.amount
        restaurant.servicepoint = restaurant.servicepoint + evaluation.service

        evaluation.save
        restaurant.save


        redirect_to  :controller => "bab", :action => "view_res", :id => params[:res_id] 

    end


    def good_menu
        user = User.find(session[:user_id])
        goodbad = Goodbad.find(params[:gb_id])
        menu = Menu.find(params[:menu_id])
        goodbad.men_id = menu.id
        goodbad.user_id = user.id

        goodbad.good = 1

        if goodbad.bad == 1
            goodbad.bad = 0
            menu.dislike = menu.dislike - 1
        end

        menu.like = menu.like + 1

        goodbad.save
        menu.save


    end

    def bad_menu
        user = User.find(session[:user_id])
        goodbad = Goodbad.find(params[:gb_id])
        menu = Menu.find(params[:menu_id])
        goodbad.men_id = menu.id
        goodbad.user_id = user.id

        goodbad.bad = 1

        if goodbad.good ==1
            goodbad.good = 0
            menu.like = menu.like - 1
        end

        menu.dislike = menu.dislike +1

        goodbad.save
        menu.save
    end

    def cancel_good
        user = User.find(session[:user_id])
        goodbad = Goodbad.find(params[:gb_id])
        menu = Menu.find(params[:menu_id])
        goodbad.men_id = menu.id
        goodbad.user_id = user.id

        goodbad.good = 0
        menu.like = menu.like - 1

        goodbad.save
        menu.save

    end

    def cancel_bad
        user = User.find(session[:user_id])
        goodbad = Goodbad.find(params[:gb_id])
        menu = Menu.find(params[:menu_id])
        goodbad.men_id = menu.id
        goodbad.user_id = user.id

        goodbad.bad = 0
        menu.dislike = menu.dislike - 1

        goodbad.save
        menu.save

    end







end
