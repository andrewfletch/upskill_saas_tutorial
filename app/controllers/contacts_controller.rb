class ContactsController < ApplicationController
  # GET request to /contact-us
  # Show new contact form
  def new
    @contact = Contact.new #creates new blank object stored in instance variable
  end
  
  # POST reuest /contacts
  def create #tell rails to save something
    # Mass assignment of form fields into contact object
    @contact = Contact.new(contact_params) #takes the form input values and assigns them to the new object (mass assignment)
    # Save the Contat object to the database
    if @contact.save
      # Store form fields via paramaters into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # Plug variables into the contact mailer email method and send email.
      ContactMailer.contact_email(name, email, body).deliver
      # Store succes message in flash hash
      # and redirect to the New action  
      flash[:success] = "Message sent."
      redirect_to new_contact_path
    else
      # If Contact object doesn't save,
      # Store errors in flash hash and redirect to new action
      flash[:danger] = @contact.errors.full_messages.join(", ") #rails makes errors for the @contacts object in full messages separated by ", "
      redirect_to new_contact_path
    end
  end
  
  private #can only be used inside this file
    # To collect data from form we need to use strong paramaters
    # and whitelist the form fields
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end