class UsersController < ApplicationController
  before_action :set_user, only: [:self, :show, :edit, :update, :destroy, :new_password, :update_password, :remove_picture]
  before_action :set_user_with_user_id, only: [:add_picture]
  before_action :ensure_that_current_user, only: [:self, :edit, :update, :destroy, :new_password, :update_password, :add_picture, :remove_picture]
  before_action :ensure_that_admin, only: [:index, :memberships, :memberships_by_year, :update_memberships, :show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if Time.now.month >= 8
      @membership_this_year = DateHelper.year
    else
      @membership_this_year = DateHelper.year - 1
    end
    @memberships = Membership.where('user_id = ? and year >= ?', @user.id, @membership_this_year).pluck(:year)
    if !@memberships.empty?
      @membership_max_year = @memberships.max
      @member = true
    else
      @member = false
    end
  end

  def self
    if Time.now.month >= 8
      @membership_this_year = DateHelper.year
    else
      @membership_this_year = DateHelper.year - 1
    end
    @memberships = Membership.where('user_id = ? and year >= ?', @user.id, @membership_this_year).pluck(:year)
    if !@memberships.empty?
      @membership_max_year = @memberships.max
      @member = true
    else
      @member = false
    end
    render 'show'
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
        format.html { redirect_to root_path, notice: 'Jäseneksi liittyminen onnistui' }
        format.json { render :index, status: :created, location: root_path }
      else
        @alert = @user.errors
        format.html { render :new, alert: @user.errors }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.skip_password_validation = true
    respond_to do |format|
      if @user.update(update_user_params)
        if admin and current_user.id != @user.id
          format.html { redirect_to @user, notice: 'Jäsentietojen muokkaus onnistui' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to self_path, notice: 'Jäsentietojen muokkaus onnistui' }
          format.json { render :show, status: :ok, location: self_path }
        end
      else
        @alert = @user.errors
        format.html { render :show }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Käyttäjätunnus poistettu' }
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
    @user.skip_password_validation = true

    respond_to do |format|
      if @user.update(params)
        if admin and current_user.id != @user.id
          format.html { redirect_to @user, notice: 'Hallitussivun kuva lisätty' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to self_path, notice: 'Hallitussivun kuva lisätty' }
          format.json { render :show, status: :ok, location: self_path }
        end
      else
        @alert = @user.errors
        format.html { render :show }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_picture
    @user.remove_avatar!
    @user.skip_password_validation = true

    respond_to do |format|
      if @user.save
        @user.avatar = nil
        if admin and current_user.id != @user.id
          format.html { redirect_to @user, notice: 'Hallitussivun kuva poistettu' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to self_path, notice: 'Hallitussivun kuva poistettu' }
          format.json { render :show, status: :ok, location: self_path }
        end
      else
        @alert = @user.errors
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
        if admin and current_user.id != @user.id
          format.html { redirect_to @user, notice: 'Salasana vaihdettu' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to self_path, notice: 'Salasana vaihdettu' }
          format.json { render :show, status: :ok, location: self_path }
        end
      end
    end
  end

  def memberships
    @year = params[:vuosi]
    if !@year
      if Time.now.month >= 8
        @year = DateHelper.year
      else
        @year = DateHelper.year - 1
      end
    end
    @year = @year.to_i
    @users = User.all
    @users = @users.sort_by{ |u| u.name }
    @non_members = @users.select{ |m| !m.membership(@year) }
  end

  def memberships_by_year
    if !params[:year]
      redirect_to memberships_path
    end
    redirect_to '/memberships/' + params[:year].to_s
  end

  def update_memberships
    params = update_memberships_params
    year = params[:year]
    params[:users].each do |param|
      user = User.find(param[0])
      member = param[1][:member]
      membership = Membership.where('user_id = ? and year = ?', user.id, year).first
      if member == '0' and membership
        membership.destroy
      elsif member == '1' and !membership
        membership = Membership.new
        membership.user_id = user.id
        membership.year = year
        membership.save
      end
    end
    respond_to do |format|
      format.html { redirect_to memberships_path, notice: 'Jäsenyyksien muokkaus onnistui' }
      format.json { render :memberships, status: :ok, location: memberships_path }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user.id)
      if admin and params[:id]
        @user = User.find(params[:id])
      end
    end

    def set_user_with_user_id
      @user = User.find(current_user.id)
      if admin and params[:user_id]
        @user = User.find(params[:user_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :firstname, :lastname, :email, :city, :password, :password_confirmation, :hyy_member, :mathstudent, :activated, :admin)
    end

    def update_user_params
      params.require(:user).permit(:firstname, :lastname, :email, :city, :hyy_member, :mathstudent, :activated, :admin)
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

    def memberships_by_year_params
      params.permit(:year)
    end
end
