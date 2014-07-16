class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
     if user  
       session[:user_id] = user.id
       redirect_to root_path, :notice => 'Logged in!'
     else
       flash[:notice] = 'Log in failed!'
       render :new
     end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end