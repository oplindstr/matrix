class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_admin

  # GET /members
  # GET /members.json
  def index
    @members = Member.all.order(:lastname, :firstname)
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_path, notice: 'Jäsenen luonti onnistui' }
        format.json { render :show, status: :created, location: @member }
      else
        @alert = @member.errors
        format.html { render :new }
        format.json { render json: @alert, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to members_path, notice: 'Jäsenen muokkaus onnistui' }
        format.json { render :show, status: :ok, location: @member }
      else
        @alert = @member.errors
        format.html { render :edit }
        format.json { render json: @alert, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Jäsenen poisto onnistui' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:firstname, :nickname, :lastname, :address, :email, :city, :hyy_member, :mathstudent, :joined)
    end
end
