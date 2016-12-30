module ApplicationHelper
  def user_authorized?
    !!session[:user_id]
  end
end
