class EventParameterTypesController < ApplicationController
  before_action :set_event_parameter_type, only: [:show, :edit, :update, :destroy]

  # GET /event_parameter_types
  # GET /event_parameter_types.json
  def index
    @event_parameter_types = EventParameterType.all
  end

  # GET /event_parameter_types/1
  # GET /event_parameter_types/1.json
  def show
  end

  # GET /event_parameter_types/new
  def new
    @event_parameter_type = EventParameterType.new
  end

  # GET /event_parameter_types/1/edit
  def edit
  end

  # POST /event_parameter_types
  # POST /event_parameter_types.json
  def create
    @event_parameter_type = EventParameterType.new(event_parameter_type_params)

    respond_to do |format|
      if @event_parameter_type.save
        format.html { redirect_to @event_parameter_type, notice: 'Event parameter type was successfully created.' }
        format.json { render :show, status: :created, location: @event_parameter_type }
      else
        format.html { render :new }
        format.json { render json: @event_parameter_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_parameter_types/1
  # PATCH/PUT /event_parameter_types/1.json
  def update
    respond_to do |format|
      if @event_parameter_type.update(event_parameter_type_params)
        format.html { redirect_to @event_parameter_type, notice: 'Event parameter type was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_parameter_type }
      else
        format.html { render :edit }
        format.json { render json: @event_parameter_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_parameter_types/1
  # DELETE /event_parameter_types/1.json
  def destroy
    @event_parameter_type.destroy
    respond_to do |format|
      format.html { redirect_to event_parameter_types_url, notice: 'Event parameter type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_parameter_type
      @event_parameter_type = EventParameterType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_parameter_type_params
      params.require(:event_parameter_type).permit(:name)
    end
end
