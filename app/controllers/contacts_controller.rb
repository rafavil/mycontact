class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update, :destroy]
  
  def index
    if params[:group_id]
      @group = Group.find(params[:group_id])
      @contacts = @group.contacts.paginate(page: params[:page], per_page: 5)
    else
      @contacts = Contact.paginate(page: params[:page], per_page: 5)
    end
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Successfully created new contact!"
      redirect_to contacts_path
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @contact.update(contact_params)
      flash[:success] = "The contact was updated!"
      redirect_to contacts_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @contact.destroy
    flash[:success] = "The contact was deleted!"
    redirect_to contacts_path
  end
  
  private
  
  def find_contact
    @contact = Contact.find(params[:id])
  end
  
  def contact_params
    params.require(:contact).permit(:name, :company, :email, :phone, :address, :avatar, :group_id)
  end
  
end
