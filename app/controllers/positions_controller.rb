class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_sub_admin

  # GET /positions
  # GET /positions.json
  def index
    @positions = Position.all.order(:priority)
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
  end

  # GET /positions/new
  def new
    @position = Position.new
  end

  # GET /positions/1/edit
  def edit
  end

  # position /positions
  # position /positions.json
  def create
    @position = Position.new(position_params)
    respond_to do |format|
      if @position.save
        format.html { redirect_to positions_path, notice: 'Uusi virka lisätty' }
        format.json { render :show, status: :ok, location: positions_path }
      else
        @alert = @position.errors
        format.html { render :new }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to positions_path, notice: 'Viran päivitys onnistui' }
        format.json { render :show, status: :ok, location: positions_path }
      else
        @alert = @position.errors
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to positions_url, notice: 'Virka poistettu' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_params
      params.require(:position).permit(:name, :name_eng, :priority, :show_in_contact_info)
    end
end
