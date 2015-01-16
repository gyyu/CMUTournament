module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end


  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in_admin?
    return (!current_user.nil? && current_user.type == "admin")
  end

  def logged_in_judge?
    return (!current_user.nil? && current_user.type == "judge")
  end

end
