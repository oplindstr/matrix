class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by username: params[:username]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to jatkantappajat_path, notice: "Tervetuloa #{@user.firstname}!"
    elsif @user && !@user.authenticate(params[:password])
      redirect_to :back, notice: "Salasana väärin"
    else !@user
      redirect_to :back, notice: "Käyttäjää #{params[:username]} ei ole!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Uloskirjautuminen onnistui"
  end
end