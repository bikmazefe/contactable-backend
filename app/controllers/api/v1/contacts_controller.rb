class Api::V1::ContactsController < Api::V1::BaseController
  before_action :set_contact, except: [:index, :create]

  def index
    contacts = @current_user.contacts.grouped
    render json: contacts
  end

  def show
    # TODO: render event logs here
  end

  def create
    contact = Contact.new(contact_params)
    contact.user = @current_user

    if contact.save
      render json: { contact: contact }, status: :created
    else
      render json: { errors: contact.errors }, status: :unprocessable_entity
    end
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end

  private

  def set_contact
    @contact ||= @current_user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone, :email)
  end
end
