class SessionsController < ApplicationController
  
  def new
     if logged_in? 

       flash[:notice] = "must logout "
       redirect_to root_path
     end
    
  end
 
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password]) 
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
         if user.admin
            redirect_to worktimes_path
         else
            redirect_to user_path(user)
        end
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    session[:online] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end
