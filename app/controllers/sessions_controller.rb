class SessionsController < ApplicationController
  def new
   
  end

  def create
    @user = User.find_by username: params[:username]
    if session[:user_id]
      redirect_to :back, alert: "Olet jo kirjautunut sisään"
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to session.delete(:return_to), notice: "Tervetuloa #{@user.firstname}!"
    elsif @user && !@user.authenticate(params[:password])
      redirect_to :back, alert: "Salasana väärin"
    elsif !@user
      redirect_to :back, alert: "Käyttäjää #{params[:username]} ei ole!"
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      redirect_to root_path, notice: "Uloskirjautuminen onnistui"
    else
      redirect_to root_path
    end
  end
end