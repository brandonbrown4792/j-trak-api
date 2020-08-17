class Api::V1::ContactsController < ApplicationController

    before_action :authenticate, :only => [:index, :create]

    def index
        if current_user
            render :json => current_user.contacts.as_json(:except => [:id, :user_id])
        else
            render :json => { message: 'Must be logged in to see contacts' }
        end
    end

    def create
        if current_user
            contact = Contact.new(contact_params)
            contact.user = current_user
            if contact.save
                render :json => contact.as_json(:except => [:id, :user_id]), :status => :ok
            else
                render :json => { message: contact.errors.full_messages.join(', ') }, :status => :bad_request
            end
        else
            render :json => { message: 'Must be logged in to create a job' }
        end
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :company, :job_title, :email, :phone, :linkedin_profile)
    end

end
