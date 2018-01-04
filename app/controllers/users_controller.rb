class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :add_picture, :new_password, :update_password, :remove_picture]
  before_action :ensure_that_current_user, only: [:show, :edit, :update]
  before_action :ensure_that_admin, only: [:index, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @member = Membership.where(user_id: @user.id, year: DateHelper.year).exists?
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.joined = Time.now

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: root_path }
      else
        format.html { render :new, alert: @user.errors }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_password
  end

  def username_recovery
  end

  def recover_username
    params = username_recovery_params
    @user = User.where(email: params[:email]).first
    respond_to do |format|
      if @user

        UserMailer.recover_username(@user).deliver_now
        format.html { redirect_to root_path, notice: 'Käyttäjätunnus lähetetty antamaasi sähköpostiosoitteeseen' }
        format.json { render root_path, status: :ok, location: root_path }
      else
        format.html { redirect_to username_recovery_path, alert: 'Käyttäjää tällä sähköpostiosoitteella ei ole olemassa' }
        format.json { render :username_recovery, status: :unprocessable_entity, location: username_recovery_path }
      end
    end
  end

  def password_recovery
  end

  def recover_password
    params = password_recovery_params
    @user = User.where(username: params[:username], email: params[:email]).first
    respond_to do |format|
      if @user 
        @password = SecureRandom.hex(4)
        if @user.update(:password => @password, :password_confirmation => @password)
          UserMailer.recover_password(@user, @password).deliver_now
          format.html { redirect_to root_path, notice: 'Uusi salasana lähetetty antamaasi sähköpostiosoitteeseen' }
          format.json { render root_path, status: :ok, location: root_path }
        else
          format.html { redirect_to password_recovery_path, alert: 'Salasanan vaihto epäonnistui' }
          format.json { render :password_recovery, status: :unprocessable_entity, location: password_recovery_path }
        end
      else
        format.html { redirect_to password_recovery_path, alert: 'Käyttäjää tällä käyttäjätunnuksella ja sähköpostiosoitteella ei ole olemassa' }
        format.json { render :password_recovery, status: :unprocessable_entity, location: password_recovery_path }
      end
    end
  end

  def add_picture
    params = add_picture_params

    respond_to do |format|
      if @user.update(params)
        format.html { redirect_to @user, notice: 'Picture was successfully added' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :show }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_picture
    @user.remove_avatar!

    respond_to do |format|
      if @user.save
        @user.avatar = nil
        format.html { redirect_to @user, notice: 'Picture was successfully removed' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :show }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password
    params = update_password_params
    respond_to do |format|
      if not @user.try(:authenticate, params[:current_password])
        format.html { redirect_to new_password_path, alert: 'Nykyinen salasana väärin' }
        format.json { render json: @user.errors, status: :unprocessable_entity, location: new_password_path } 
      end
      if not @user.update(:password => params[:new_password], :password_confirmation => params[:new_password_confirmation])
        format.html { redirect_to new_password_path, alert: 'Uuden salasanan vahvistus väärin' }
        format.json { render json: @user.errors, status: :unprocessable_entity, location: new_password_path } 
      else
        format.html { redirect_to @user, notice: 'Password was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      end
    end
  end

  def memberships
    @year = params[:vuosi]
    if !@year
      @year = Time.now.year
    end
    @users = User.all
    @users = @users.sort_by{ |u| u.name }
  end

  def update_memberships
    params = update_memberships_params
    year = params[:year]
    params[:users].each do |param|
      user = User.find(param[0])
      member = param[1][:member]
      membership = Membership.where('user_id = ? and year = ?', user.id, year).first
      if member = '0' and membership
        membership.destroy
      elsif member = '1' and !membership
        membership = Membership.new
        membership.user_id = user.id
        membership.year = year
        membership.save
      end
    end
    respond_to do |format|
      format.html { redirect_to memberships_path, notice: 'Success' }
      format.json { render :memberships, status: :ok, location: memberships_path }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  def ensure_that_current_user
    if !current_user or current_user.id != @user.id
      ensure_that_admin
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :firstname, :lastname, :email, :city, :password, :password_confirmation, :hyy_member, :mathstudent, :activated, :admin)
    end

    def update_password_params
      params.require(:user).permit(:current_password, :new_password, :new_password_confirmation)
    end

    def add_picture_params
      params.require(:user).permit(:avatar)
    end

    def username_recovery_params
      params.permit(:email)
    end

    def password_recovery_params
      params.permit(:username, :email)
    end

    def update_memberships_params
      params.permit(:year, :users => [:member])
    end
end
