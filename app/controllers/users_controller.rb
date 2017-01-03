class UsersController < ApplicationController

  skip_before_action :authenticate_user, only: [:new, :create]

  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :check_signed_in, only: :new

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome, #{@user.name}."
    else
      render :new
    end
  end

  def show
    @user = !params[:id] ? current_user : User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: 'Profile updated'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Profile deleted'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def check_signed_in
    redirect_to root_path if current_user
  end
end
