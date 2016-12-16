class ContactsController < ApplicationController
  def new
    @contact = Contact.new #creates new blank object stored in instance variable
  end
  
  def create #tell rails to save something
    @contact = Contact.new(contact_params) #takes the form input values and assigns them to the new object (mass assignment)
    if @contact.save
      redirect_to new_contact_path, notice: "Message sent."
    else
      redirect_to new_contact_path, notice: "Error occured."
    end
  end
  
  private #can only be used inside this file
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end