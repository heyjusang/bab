class Admin::ContactsController < Admin::AdminController
  def index
    @contacts = Contact.all
  end
  def new
    @contact = Contact.new
  end
  def create
    contact = Contact.new(params[:contact])
    contact.user_id = session[:user_id]
    contact.save
  end
  def destroy
    Contact.new.destroy(params[:id])

    redirect_to :action => admin_contacts_path
  end
end
