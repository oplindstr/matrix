class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :new_password, :update_password]
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
    @player = @user.player
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

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: root_path }
      else
        format.html { render :new }
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

  def update_password
    params = update_password_params
    respond_to do |format|
      if not @user.try(:authenticate, params[:current_password])
        format.html { redirect_to new_password_path, notice: 'Nykyinen salasana väärin' }
        format.json { render json: @user.errors, status: :unprocessable_entity, location: new_password_path } 
      end
      if not @user.update(:password => params[:new_password], :password_confirmation => params[:new_password_confirmation])
        format.html { redirect_to new_password_path, notice: 'Uuden salasanan vahvistus väärin' }
        format.json { render json: @user.errors, status: :unprocessable_entity, location: new_password_path } 
      else
        format.html { redirect_to @user, notice: 'Password was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      end
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
      params.require(:user).permit(:username, :firstname, :lastname, :email, :city, :password, :password_confirmation, :hyy_member, :mathstudent, :activated)
    end

    def update_password_params
      params.require(:user).permit(:current_password, :new_password, :new_password_confirmation)
    end
end
