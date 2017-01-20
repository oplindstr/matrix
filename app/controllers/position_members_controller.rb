class PositionMembersController < ApplicationController
  before_action :set_year, only: [:index, :new]
  
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
    @users = User.all
    @years = (1995..@year+1).to_a
    @positions = Position.all
  end

  # GET /positions/1/edit
  def edit
  end

  # position /positions
  # position /positions.json
  def create
  	@position_member = PositionMember.new(position_member_params)
      
    if @position_member.save
       redirect_to '/hallitus', notice: "The position member has been uploaded."
    else
       render "new"
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
      @member = PositionMember.find(params[:id])
      @member.destroy
      redirect_to '/board_members_and_positions', notice:  "The record has been deleted."
   end

  private
  	def set_year
      @year = DateHelper.year
    end

    def position_member_params
      params.require(:position_member).permit(:user_id, :year, :position_id)
    end
end
