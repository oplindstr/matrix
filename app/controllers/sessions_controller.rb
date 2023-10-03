class SessionsController < ApplicationController
  def new
   
  end

  def create
    @user = User.find_by username: params[:username]
    if session[:user_id]
      redirect_back(fallback_location: root_path, alert: I18n.t('already_logged_in'))
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to session.delete(:return_to), notice: "#{I18n.t('Welcome')} #{@user.firstname}!"
    elsif @user && !@user.authenticate(params[:password])
      redirect_back(fallback_location: root_path, alert: I18n.t('wrong_password'))
    elsif !@user
      redirect_back(fallback_location: root_path, alert: I18n.t('user_doesnt_exist'))
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      redirect_to root_path, notice: I18n.t('logout_successful')
    else
      redirect_to root_path
    end
  end
end