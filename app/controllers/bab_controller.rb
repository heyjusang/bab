class BabController < ApplicationController

    def index

        @taste_restaurants = Restaurant.order('tastepoint/count desc limit 5')
        @speed_restaurants = Restaurant.order('speedpoint/count desc limit 5')
        @amount_restaurants = Restaurant.order('amountpoint/count desc limit 5')
        @service_restaurants = Restaurant.order('servicepoint/count desc limit 5')

        @new_restaurants = Restaurant.order('created_at desc limit 3')

        @new_evaluations = Evaluation.order('created_at desc limit 3')

    end
    def view_res
        @restaurant = Restaurant.find(params[:res_id])
        @ev_temps = Evaluation.find(:all, :order => "created_at desc", :conditions => ['restaurant_id = ?', params[:res_id]], :limit => 3)
        @menus = Menu.where(:restaurant_id => params[:res_id])

        menus = []
        @menus.each do |m|
        menu = {}
        goodbad = {}
        menu['menu'] = m
            @goodbad = m.goodbads.first(:conditions => ['user_id = ?', session[:user_id]])
        menu['goodbad'] = @goodbad
        menus << menu
        end



        render :json => {:restaurant => @restaurant, :ev_temps => @ev_temps, :menus => menus}
    end

    def more_comment
    end

end
