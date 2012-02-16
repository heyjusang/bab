class Admin::MenusController < Admin::AdminController

    def new
        @menu = Menu.new
    end

    def create
        menu = Menu.new(params[:menu])
        menu.liking = 0
        menu.disliking = 0
        restaurant = Restaurant.find(params[:restaurant_id])
        menu.restaurant_id = restaurant.id

        menu.save
        redirect_to admin_restaurant_path(:id => menu.restaurant_id)
    end

    def edit
        @menu = Menu.find(params[:id])
    end
    
    def update
        menu = Menu.update(params[:id], params[:menu])

        redirect_to admin_restaurant_path(:id => menu.restaurant_id)
    end

    def destroy
        menu = Menu.destroy(params[:id])
        goodbad = Goodbad.destroy(params[:id])

        redirect_to admin_restaurant_path(:id => menu.restaurant_id)
    end






end
