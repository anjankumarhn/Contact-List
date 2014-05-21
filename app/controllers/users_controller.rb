class UsersController < ApplicationController
  respond_to :html, :js


   def new
      @user = User.new
   end

   def create
      @user = User.new(user_params)  
      if @user.save
      session[:user_id] = @user.id
      redirect_to new_contact_path, :notice => "Signed up!"
    else
      redirect_to root_path
    end
  end


  private

	def user_params
		params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :address, :city, :pincode, :state, :country)
	end
end
