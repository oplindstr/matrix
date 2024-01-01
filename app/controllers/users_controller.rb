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
      @membership_this_year = DateUtils.year
    else
      @membership_this_year = DateUtils.year - 1
    end
    @member = @user.member
    if @member
      @memberships = Membership.where('member_id = ? and year >= ?', @member.id, @membership_this_year).pluck(:year)
    end
    if @memberships and !@memberships.empty?
      @membership_max_year = @memberships.max
      @is_member = true
    else
      @is_member = false
    end
  end

  def self
    if Time.now.month >= 8
      @membership_this_year = DateUtils.year
    else
      @membership_this_year = DateUtils.year - 1
    end
    @member = @user.member
    if @member
      @memberships = Membership.where('member_id = ? and year >= ?', @member.id, @membership_this_year).pluck(:year)
    end
    if @memberships and !@memberships.empty?
      @membership_max_year = @memberships.max
      @is_member = true
    else
      @is_member = false
    end
    render 'show'
  end

  # GET /users/new
  def new
    @user = User.new
    @user.build_member
    @member_instruction = Text.where('name = ?', 'Jäsenyysohje').first
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    @member = Member.where('email = ? and user_id is null', @user.member.email).first
    if @member
      @member.firstname = @user.member.firstname
      @member.lastname = @user.member.lastname
      @member.address = @user.member.address
      @member.city = @user.member.city
      @member.hyy_member = @user.member.hyy_member
      @member.mathstudent = @user.member.mathstudent
      @user.member = @member
    else
      @user.member.joined = Time.now.year
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Jäsenhakemuksen lähettäminen onnistui.' }
        format.json { render :index, status: :created, location: root_path }
      else
        @alert = @user.errors
        @member_instruction = Text.where('name = ?', 'Jäsenyysohje').first
        format.html { render :new, alert: @alert }
        format.json { render json: @alert, status: :unprocessable_entity }
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
        if Time.now.month >= 8
          @membership_this_year = DateUtils.year
        else
          @membership_this_year = DateUtils.year - 1
        end
        @member = @user.member
        if @member
          @memberships = Membership.where('member_id = ? and year >= ?', @member.id, @membership_this_year).pluck(:year)
        end
        if @memberships and !@memberships.empty?
          @membership_max_year = @memberships.max
          @member = true
        else
          @member = false
        end
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
    @member = Member.where(email: params[:email]).first
    if @member
      @user = @member.user
    end
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
    @member = Member.where(email: params[:email]).first
    if @member
      @user_id = @member.user_id
      if @user_id
        @user = User.where(username: params[:username], id: @user_id).first
      end
    end
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
        @year = DateUtils.year
      else
        @year = DateUtils.year - 1
      end
    end
    @year = @year.to_i
    @users = Member.all
    @users = @users.sort_by{ |u| u.name }
  end

  def memberships_by_year
    if !params[:year]
      redirect_to memberships_path
    end
    redirect_to '/memberships/' + params[:year].to_s
  end

  def update_memberships
    params = update_memberships_params
    year = params[:year].to_i
	next_year = year + 1
    params[:users].each do |param|
      user = Member.find(param[0])
      member_this_year = param[1][:member_this_year]
	  member_next_year = param[1][:member_next_year]
      member_id = user.id

	  member = member_this_year
      membership = Membership.where('member_id = ? and year = ?', member_id, year).first
      if member == '0' and membership
        membership.destroy
      elsif member == '1' and !membership
        membership = Membership.new
        membership.member_id = member_id
        membership.year = year
        membership.save
      end

	  member = member_next_year
      membership = Membership.where('member_id = ? and year = ?', member_id, next_year).first
      if member == '0' and membership
        membership.destroy
      elsif member == '1' and !membership
        membership = Membership.new
        membership.member_id = member_id
        membership.year = next_year
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
      params.require(:user).permit(:id, :username, :password, :password_confirmation, :member_attributes => [:id, :firstname, :nickname, :lastname, :email, :address, :city, :joined, :hyy_member, :mathstudent, :tg_nick, :_destroy])
    end

    def update_user_params
      params.require(:user).permit(:id, :member_attributes => [:id, :firstname, :nickname, :lastname, :email, :address, :city, :joined, :hyy_member, :mathstudent, :tg_nick, :_destroy])
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
      params.permit(:year, :users => [:member_this_year, :member_next_year])
    end

    def memberships_by_year_params
      params.permit(:year)
    end
end
