class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :save_current_url

  helper_method :current_user
  helper_method :admin
  helper_method :sub_admin
  helper_method :get_setting

  def save_current_url
    session[:return_to] = request.referer
  end

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def admin
    return nil if not current_user
    current_user.admin
  end

  def sub_admin
    return false if !current_user
    return true if admin
    @board_member = BoardMember.where("year = ? AND user_id = ?", Date.today.year, current_user.id)
    return true if @board_member
    @position_member = PositionMember.where("year = ? AND user_id = ?", Date.today.year, current_user.id)
    return true if @position_member
    false
  end

  def ensure_that_admin
    redirect_to root_path, notice:"" if not admin
  end

  def get_setting(setting)
    @setting = Setting.where("setting = ?", setting).first
    return "" if not @setting
    @setting.value
  end

end
