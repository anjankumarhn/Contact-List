class ContactsController < ApplicationController
     before_filter :require_login

	def index
		#@contacts = Contact.all
		 @contacts = Contact.search(params[:search]).order("firstname").page(params[:page]).per(9)
		end

	def show
		@contact = Contact.find(params[:id])
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to contacts_path
		else
			render 'new'
		end

	end

	def edit
		@contact = Contact.find(params[:id])
	end


	def update
		@contact = Contact.find(params[:id])

		if @contact.update(contact_params)
			redirect_to contacts_path
		else
			render 'edit'
		end
	end

	def destroy
		@contact = Contact.find(params[:id])
	    @contact.destroy

		redirect_to contacts_path
	end



	

	private

	def contact_params
		params.require(:contact).permit(:firstname, :lastname, :email, :phonenumber)
	end
end
