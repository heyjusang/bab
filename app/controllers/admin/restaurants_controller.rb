class Admin::RestaurantsController < Admin::AdminController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.new(params[:restaurant])
    restaurant.tastepoint = 5
    restaurant.speedpoint = 5
    restaurant.amountpoint = 5
    restaurant.servicepoint = 5
    restaurant.count = 1
    restaurant.save
    redirect_to :action => admin_restaurants_path
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    restaurant = Restaurant.update(params[:id], params[:restaurant])

    redirect_to :action => admin_restaurants_path
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = @restaurant.menus
  end

  def destroy
    Restaurant.destroy(params[:id])

    redirect_to :action => admin_restaurants_path
  end
end
