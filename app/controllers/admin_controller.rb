class AdminController < ApplicationController
layout nil
#####for restaurant#####
    def index
        @restaurants = Restaurant.all
    end

    def new_restaurant
        @restaurant = Restaurant.new
    end

    def create_restaurant
        restaurant = Restaurant.new(params[:restaurant])
        restaurant.point = 0
        restaurant.count = 0

        restaurant.save

        redirect_to :action => "index"
    end
    
    def edit_restaurant
        @restaurant = Restaurant.find(params[:id])
    end
    
    def update_restaurant
        restaurant = Restaurant.update(params[:id], params[:restaurant])

        redirect_to :action => "index"
    end

    def view_restaurant
        @restaurant = Restaurant.find(params[:id])
        @menus = @restaurant.menus
    end
    
    def destroy_restaurant
        Restaurant.destroy(params[:id])
    
        redirect_to :action => "index"
    end

#####for menu#####

    def new_menu
        @menu = Menu.new
    end

    def create_menu
        menu = Menu.new(params[:menu])
        menu.like = 0
        menu.dislike = 0
        restaurant = Restaurant.find(params[:restaurant_id])
        menu.restaurant_id = restaurant.id

        menu.save

        redirect_to :action => "view_restaurant", :id => menu.restaurant_id
    end

    def edit_menu
        @menu = Menu.find(params[:id])
    end
    
    def update_menu
        menu = Menu.update(params[:id], params[:menu])

        redirect_to :action => "view_restaurant", :id => menu.restaurant_id
    end

    def destroy_menu
        menu = Menu.destroy(params[:id])

        redirect_to :action => "view_restaurant", :id => menu.restaurant_id
    end






    
end
