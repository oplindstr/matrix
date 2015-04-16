class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :admin

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def admin
    return nil if not current_user
    current_user.admin
  end

  def ensure_that_admin
    redirect_to jatkantappajat_path, notice:"" if not admin
  end

  def ensure_that_logged_in
    redirect_to jatkantappajat_path, notice:"" if not current_user
  end

end
