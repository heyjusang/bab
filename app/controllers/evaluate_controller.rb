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


        @restaurant = Restaurant.find(params[:res_id])
        @evaluation = Evaluation.new
        render :layout => false



    end

    def create_ev
      evaluation = Evaluation.new(params[:evaluation])

      if (evaluation.review.length<10) || (evaluation.review.length>100)
        redirect_to :back, :notice => "dd" 
      else


        if (evaluation.taste>=0 && evaluation.taste<=10)&&(evaluation.speed>=0 && evaluation.speed<=10)&&(evaluation.amount>=0 && evaluation.amount<=10) && (evaluation.service>=0 && evaluation.service<=10)



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


          redirect_to  :controller => "bab", :action => "index"

        else
          redirect_to :back

        end

      end
    end


    def good_menu
        user = User.find(session[:user_id])
        if Goodbad.first( :conditions => ['user_id = ? and menu_id =?', session[:user_id], params[:menu_id]])
        goodbad =  Goodbad.first( :conditions => ['user_id = ? and menu_id =?', session[:user_id], params[:menu_id]])
        menu = Menu.find(params[:menu_id])
        else
        goodbad = Goodbad.new
        goodbad.good = false
        goodbad.bad = false
        menu = Menu.find(params[:menu_id])
        goodbad.menu_id = menu.id
        goodbad.user_id = user.id
        end
        if goodbad.good == false
            goodbad.good = true

            if goodbad.bad == true
                goodbad.bad = false
                menu.dislike = menu.dislike - 1
            end

            menu.like = menu.like + 1
        end
        goodbad.save
        menu.save

        render :json => menu

    end

    def bad_menu
        user = User.find(session[:user_id])
        if Goodbad.first( :conditions => ['user_id = ? and menu_id =?', session[:user_id], params[:menu_id]])
        goodbad =  Goodbad.first( :conditions => ['user_id = ? and menu_id =?', session[:user_id], params[:menu_id]])
        menu = Menu.find(params[:menu_id])
        else
        goodbad = Goodbad.new
        goodbad.good = false
        goodbad.bad = false
        menu = Menu.find(params[:menu_id])
        goodbad.menu_id = menu.id
        goodbad.user_id = user.id
        end
    
        if goodbad.bad == false
        goodbad.bad = true

            if goodbad.good == true
                goodbad.good = false
                menu.like = menu.like - 1
            end

            menu.dislike = menu.dislike + 1
        end

        goodbad.save
        menu.save

        render :json => menu
    end

    def cancel_good
        user = User.find(session[:user_id])
        goodbad = Goodbad.first(:conditions => ['user_id = ? and menu_id = ?', session[:user_id], params[:menu_id]])
        menu = Menu.find(params[:menu_id])
        if goodbad.good == true
        goodbad.good = false
        menu.like = menu.like - 1
        end
        goodbad.save
        menu.save
        render :json => menu

    end

    def cancel_bad
        user = User.find(session[:user_id])
        goodbad = Goodbad.first(:conditions => ['user_id =? and menu_id =?', session[:user_id], params[:menu_id]])
        menu = Menu.find(params[:menu_id])
        if goodbad.bad == true
        goodbad.bad = false
        menu.dislike = menu.dislike - 1
        end
        goodbad.save
        menu.save
        render :json => menu

    end







end
