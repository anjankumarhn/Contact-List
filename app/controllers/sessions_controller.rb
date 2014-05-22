class SessionsController < ApplicationController
  respond_to :html, :js
  def new
    
  end

  def create
    if params[:provider]
      user = User.from_omniauth(env["omniauth.auth"])
    else
      user = User.authenticate(params[:email], params[:password]) 
    end 
    if user  
      session[:user_id] = user.id  
      flash[:alert] = "you are successfully logged in "
      redirect_to new_contact_path 
    else  
      flash.now.alert = "Invalid email or password"  
      redirect_to welcome_index_path 
    end  
  end  

  


  def destroy  
    session[:user_id] = nil  
    redirect_to welcome_index_path, :notice => "Logged out!"  
  end  
end

