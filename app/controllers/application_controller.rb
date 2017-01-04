class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user

  helper_method :current_user

  private

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate_user
    unless current_user
      redirect_to login_url, notice: 'You need to Log In'
    end
  end
end
