#encoding = UTF-8
class BabController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :main, :today_res, :search, :show_all,:select, :select_result, :new_contact, :create_contact, :deny_access, :select_help, :select_result_help]

  def index

  end
  def main

    @taste_restaurants = Restaurant.order('tastepoint/count desc limit 5')
    @speed_restaurants = Restaurant.order('speedpoint/count desc limit 5')
    @amount_restaurants = Restaurant.order('amountpoint/count desc limit 5')
    @service_restaurants = Restaurant.order('servicepoint/count desc limit 5')

    @new_restaurants = Restaurant.order('created_at desc limit 3')

    @new_evaluations = Evaluation.order('created_at desc limit 3')
    render :layout => false
  end  
  def view_menu
    @num = params[:res_id]
    @menus = Menu.where(:restaurant_id => params[:res_id]).order("liking+disliking DESC")
    @menus_all = []
    @set_all = []
    @menus.each do |m|
      menu = {}
      goodbad = {}
      menu['menu'] = m
      @goodbad = m.goodbads.first(:conditions => ['user_id = ?', session[:user_id]])
      menu['goodbad'] = @goodbad
      if m.setmenu == false
      @menus_all << menu
      elsif m.setmenu == true
        @set_all << menu
      end
    end 
    render :layout => false
  end
  def view_res
    @restaurant = Restaurant.find(params[:res_id])
    @ev_temps = Evaluation.find(:all, :order => "created_at desc", :conditions => ['restaurant_id = ?', params[:res_id]], :limit => 3)
    # @menus = Menu.where(:restaurant_id => params[:res_id])
    # @menu_view_res = @menus.sort_by{"|m| (m.liking-m.disliking)"}.first(1)
     @menu_view_res = Menu.where(:restaurant_id => params[:res_id]).order("liking-disliking DESC").limit(1)
    #@menus_all = []
    #@set_all = []
    #@menus.each do |m|
     # menu = {}
      #goodbad = {}
      #menu['menu'] = m
      #@goodbad = m.goodbads.first(:conditions => ['user_id = ?', session[:user_id]])
      #menu['goodbad'] = @goodbad

      #if m.setmenu == false
      #@menus_all << menu
      #elsif m.setmenu == true
       # @set_all << menu
      #end
    #end

    render :layout => false

  end

  def more_comment
    @num = params[:res_id]
    @ev_all = Evaluation.find(:all, :order => "created_at desc", :conditions => ['restaurant_id = ?', params[:res_id]])

    render :layout => false

  end
  def show_all
    if params[:type] == 'chinese'
      @results = Restaurant.where("restype = ?", "중식").paginate(:page => params[:page], :per_page => 12)
    elsif params[:type] == "chicken"
      @results = Restaurant.where("restype =?","치킨").paginate(:page => params[:page], :per_page => 12)
    elsif params[:type] == "pizza"
      @results = Restaurant.where("restype =?","피자").paginate(:page => params[:page], :per_page => 12)
    elsif params[:type] == "korea"
      @results = Restaurant.where("restype = ?","한식").paginate(:page => params[:page], :per_page => 12)
    elsif params[:type] == "dosirak"
      @results = Restaurant.where("restype = ?","도시락").paginate(:page => params[:page], :per_page => 12)
    elsif params[:type] == "etc"
      @results = Restaurant.where("restype = ?","기타").paginate(:page => params[:page], :per_page => 12)
    else
      @results = Restaurant.paginate(:page => params[:page], :per_page => 12)
    end
    render :layout => false
  end
  def search
      @results = Restaurant.where('resname LIKE ? ',"%#{params[:search]}%").paginate(:page => params[:page], :per_page => 4)
    render :layout => false
  end

  def select

    render :layout => false
  end
  def today_res
    date = Time.now.year.to_s + Time.now.month.to_s + Time.now.day.to_s

    r = Recommendation.find_by_date(date)

    if r.nil?
      samples = []
      samples.concat(Restaurant.all)
      choice = samples.sample
      res_id = choice.id
      new_r = Recommendation.new
      new_r.date = date
      new_r.res_id = res_id
      new_r.save
      @today_res = choice
    else
      @today_res = Restaurant.find(r.res_id)
    end
    @today_menus = Menu.where(:restaurant_id => @today_res.id)
    @menu_today_res = @today_menus.sort_by{"|m| (m.liking-m.disliking)"}.first(1)




    render :layout => false
  end

  def select_result
    ########################################select type##
    @selected = []
    if (params[:chinese] == "1")
      @selected.concat(Restaurant.where('restype = ? ' , '중식'))
    end
    if (params[:pizza] == "1")
      @selected.concat(Restaurant.where('restype = ?', '피자'))
    end
    if (params[:chicken] == "1")
      @selected.concat(Restaurant.where('restype = ?', '치킨'))
    end
    if (params[:dosirak] == "1")
      @selected.concat(Restaurant.where('restype = ?', '도시락'))
    end
    if (params[:korea] == "1")
      @selected.concat(Restaurant.where('restype = ?', '한식'))
    end
    if (params[:etc] == "1")
      @selected.concat(Restaurant.where('restype = ?', '기타'))
    end
    if (@selected.count == 0)
      @selected.concat(Restaurant.all)
    end
    ######################################################
    ############################priority select###########
    p1 = params[:priority_1] 
    p2 = params[:priority_2] 
    p3 = params[:priority_3] 
    p4 = params[:priority_4]



    if (params["#{p1}_level"] == "0")
      filtering_1 = @selected.sort_by{"|f1| (f1.#{p1}point/f1.count)"}.first(10)
    elsif (params["#{p1}_level"] == "1")
      filtering_1 = @selected.sort_by{"|f1| f1.count"}.first(10)
    elsif (params["#{p1}_level"] == "2")
      filtering_1 = @selected.sort_by{"|f1| -(f1.#{p1}point/f1.count)"}.first(10)
    end 
    if (params["#{p2}_level"] == "0")
      filtering_2 = filtering_1.sort_by{"|f1| (f1.#{p2}point/f1.count)"}.first(7)
    elsif (params["#{p2}_level"] == "1")
      filtering_2 = filtering_1.sort_by{"|f1| f1.count"}.first(7)
    elsif (params["#{p2}_level"] == "2")
      filtering_2 = filtering_1.sort_by{"|f1| -(f1.#{p2}point/f1.count)"}.first(7)
    end 
    if (params["#{p3}_level"] == "0")
      filtering_3 = filtering_2.sort_by{"|f1| (f1.#{p3}point/f1.count)"}.first(5)
    elsif (params["#{p3}_level"] == "1")
      filtering_3 = filtering_2.sort_by{"|f1| f1.count"}.first(5)
    elsif (params["#{p3}_level"] == "2")
      filtering_3 = filtering_2.sort_by{"|f1| -(f1.#{p3}point/f1.count)"}.first(5)
    end 
    if (params["#{p4}_level"] == "0")
      filtering_4 = filtering_3.sort_by{"|f1| (f1.#{p4}point/f1.count)"}.first(3)
    elsif (params["#{p4}_level"] == "1")
      filtering_4 = filtering_3.sort_by{"|f1| f1.count"}.first(3)
    elsif (params["#{p4}_level"] == "2")
      filtering_4 = filtering_3.sort_by{"|f1| -(f1.#{p4}point/f1.count)"}.first(3)
    end 
    ######################################################
    @final_sel = filtering_4.sample
    @final_menus = Menu.where(:restaurant_id => @final_sel.id)
    @menu_final_res = @final_menus.sort_by{"|m| (m.liking-m.disliking)"}.first(1)
    render :layout => false
  end
  
  def new_contact
    @contact = Contact.new
    render :layout => false
  end

  def create_contact
    contact = Contact.new(params[:contact])
    if session[:user_id].nil?
      contact.user_id = 1
    else
      contact.user_id = session[:user_id]
    end

    contact.save
    
    redirect_to :action => "index", :controller => "bab" 
  end

  def select_help
    render :layout => false
  end
  def select_result_help
    render :layout => false
  
  end

end
