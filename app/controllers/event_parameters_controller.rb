class EventParametersController < ApplicationController
  before_action :set_event_parameter, only: [:show, :edit, :destroy]
  before_action :set_event, only: [:new, :update]
  before_action :ensure_that_sub_admin

  # GET /event_parameters
  # GET /event_parameters.json
  def index
    @event_parameters = EventParameter.all
  end

  # GET /event_parameters/1
  # GET /event_parameters/1.json
  def show
  end

  # GET /event_parameters/new
  def new
    @event_parameter_types = EventParameterType.all
  end

  # GET /event_parameters/1/edit
  def edit
  end

  # POST /event_parameters
  # POST /event_parameters.json
  def create
    @event_parameter = EventParameter.new(event_parameter_params)
    @event = Event.find(@event_parameter.event_id)

    respond_to do |format|
      if @event_parameter.save
        format.html { redirect_to @event, notice: 'Lisätietokenttä lisätty' }
        format.json { render :show, status: :created, location: @event }
      else
        @alert = @event_parameter.errors
        format.html { render :new }
        format.json { render json: @event_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_parameters/1
  # PATCH/PUT /event_parameters/1.json
  def update
    respond_to do |format|
      params = event_parameter_params
      byebug
      if @event.update(params)
        format.html { redirect_to @event, notice: 'Lisätietokentät lisätty' }
        format.json { render :show, status: :ok, location: @event }
      else
        @alert = @event.errors
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_parameters/1
  # DELETE /event_parameters/1.json
  def destroy
    @event_parameter.destroy
    respond_to do |format|
      format.html { redirect_to event_parameters_url, notice: 'Lisätietokenttä poistettu' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_parameter
      @event_parameter = EventParameter.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
     def event_parameter_params
      params.require(:event).permit(:event_parameters_attributes => [:name, :event_parameter_type_id, :event_parameter_choices_attributes => [:value]])
    end
end
