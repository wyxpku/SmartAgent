class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
     if user
       session[:user_id] = user.id
       flash[:success] = "登陆成功！欢迎回来~"
       redirect_to pages_createapp_path
     else
       flash[:danger] = "糟糕! 邮箱或密码错误"
       redirect_to signin_path
     end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
