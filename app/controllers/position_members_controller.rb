class PositionMembersController < ApplicationController
  before_action :set_year, only: [:index, :new]
  before_action :ensure_that_sub_admin
  
  # GET /positions
  # GET /positions.json
  def index
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
  end

  # GET /positions/new
  def new
  	@position_member = PositionMember.new
    @members = Member.all.order(:firstname, :lastname)
    @years = (1995..@year+1).to_a
    @this_year = Time.now.year
    if admin
      @positions = Position.all.order(:name)
    else
      @positions = Position.where('admin is null or admin = ?', false).order(:name)
    end
  end

  # GET /positions/1/edit
  def edit
    @position_member = PositionMember.find(params[:id])
    @members = Member.all.order(:firstname, :lastname)
    if admin
      @positions = Position.all.order(:name)
    else
      @positions = Position.where('admin is null or admin = ?', false).order(:name)
    end
  end

  # position /positions
  # position /positions.json
  def create
  	@position_member = PositionMember.new(position_member_params)
    if position_member_params[:member_id] and !position_member_params[:member_id].empty?
      @member = Member.find(position_member_params[:member_id])
      if params[:avatar]
        @user = @member.user
        if @user and !@user.avatar_url
          @user.skip_password_validation = true
          @user.avatar = params[:avatar]
          @user.save!
        end
      end
      @position_member.name = @member.name
    end

    respond_to do |format|
      if @position_member.save
         format.html { redirect_to '/hallitus', notice: "Virkailija lisätty" }
      else
        @alert = @position_member.errors
        @year = DateHelper.year
        @this_year = Time.now.year
        @position_member = PositionMember.new
        @members = Member.all.order(:firstname, :lastname)
        @years = (1995..@year+1).to_a
        if admin
          @positions = Position.all.order(:name)
        else
          @positions = Position.where('admin is null or admin = ?', false).order(:name)
        end
        format.html { render :new, status: :unprocessable_entity, location: new_position_member_path }
      end
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
    @position_member = PositionMember.find(params[:id])

    if position_member_params[:member_id] and !position_member_params[:member_id].empty?
      @member = Member.find(position_member_params[:member_id])
      if params[:avatar]
        @user = @member.user
        if @user and !@user.avatar_url
          @user.skip_password_validation = true
          @user.avatar = params[:avatar]
          @user.save!
        end
      end
      @position_member.name = @member.name
    end

    respond_to do |format|
      if @position_member.update(position_member_params)
        format.html { redirect_to '/board_members_and_positions', notice: "Virkailijaa muokattu" }
      else
        @alert = @position_member.errors
        @members = Member.all.order(:firstname, :lastname)
        if admin
          @positions = Position.all.order(:name)
        else
          @positions = Position.where('admin is null or admin = ?', false).order(:name)
        end
        format.html { render :new, status: :unprocessable_entity, location: edit_board_member_path }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
      @member = PositionMember.find(params[:id])
      @member.destroy
      redirect_to '/board_members_and_positions', notice:  "Virkailija poistettu"
   end

  private

  	def set_year
      @year = DateHelper.year
    end

    def position_member_params
      params.require(:position_member).permit(:member_id, :year, :name, :position_id)
    end
end
