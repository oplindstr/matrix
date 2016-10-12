class PositionController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

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
  end

  # GET /positions/1/edit
  def edit
  end

  # position /positions
  # position /positions.json
  def create
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
  end

  def contact_info
  	@contact_positions = Position.where(show_in_contact_info: true)
    render 'pages/yhteystiedot'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_params
      params.require(:position).permit(:name)
    end
end
