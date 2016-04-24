class ContactsController < ApplicationController
  def index
    @contact = Contact.new(contact_params)
  end
  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactMailer.new_message(@contact).deliver_now
      redirect_to(contacts_path , :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
