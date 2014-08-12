class SessionsController < ApplicationController
  
  def login
  end

  def home
  end

  def create
    user = User.find_by_user_id(params[:user_id])

    if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.user_id
      redirect_to :action => "home"
    else
      @error_val = "Invalid email or password"
      render "login"
    end
  end

  def authlogin
    user = Oauth.from_omniauth(env["omniauth.auth"])
    puts user.name
    session[:user_id] = user.name
    if user.image != nil
      session[:image] = user.image
    end
    render "home"
  end

   def destroy
    session[:user_id] = nil
    session[:image] = nil
    redirect_to root_path
  end


  def clear
    session[:user_id] = nil
    session[:image] = nil
    render "login"
  end
end
