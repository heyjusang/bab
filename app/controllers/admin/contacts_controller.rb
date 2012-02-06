class Admin::ContactsController < Admin::AdminController
  def index
    @contacts = Contact.order('created_at desc').all
  end
  def destroy
    Contact.new.destroy(params[:id])

    redirect_to :action => admin_contacts_path
  end
  def show

    @contact = Contact.find(params[:id])
  end

  def destroy
    Contact.destroy(params[:id])

    redirect_to :action => admin_contacts_path

  end
end
