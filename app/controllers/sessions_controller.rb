class SessionsController < ApplicationController

  skip_before_action :authenticate_user

  def new
  end

  def create
    user = User.find_by(email: params[:login][:email])
    if user and user.authenticate(params[:login][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Hello, #{user.name}."
    else
      flash.now.alert = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end
end
