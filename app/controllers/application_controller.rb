class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def index
  end

  def require_admin
    unless logged_in_admin?
      flash['danger'] = "You do not have permission for that"
      redirect_to "/"
    end
  end

end
