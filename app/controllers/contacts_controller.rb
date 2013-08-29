class ContactsController < ApplicationController
  before_filter :logged?, only: [:index, :edit, :update, :destroy, :show]
  layout :selectlayout
  
  def new 
    @contact = Contact.new 
  end  

  def create 
    @contact = Contact.new(params[:contact])   
    if @contact.valid? 
      ContactMailer.contact_message(params[:contact]).deliver
      redirect_to '/' 
      return 
    end   
    render :action => 'new' 
  end 
end