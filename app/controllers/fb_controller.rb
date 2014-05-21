class FbController < ApplicationController
def new
    
  end

  def create
    fb = Fb.from_omniauth(env["omniauth.auth"])
    session[:user_id] = fb.id
    redirect_to new_contact_path
  end

  def destroy  
    fb[:user_id] = nil  
    redirect_to welcome_index_path, :notice => "Logged out!"  
  end  

end
