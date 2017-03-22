class EventParameterValuesController < ApplicationController
  before_action :set_event_parameter_value, only: [:show, :edit, :update, :destroy]

  # GET /event_parameter_values
  # GET /event_parameter_values.json
  def index
    @event_parameter_values = EventParameterValue.all
  end

  # GET /event_parameter_values/1
  # GET /event_parameter_values/1.json
  def show
  end

  # GET /event_parameter_values/new
  def new
    @event_parameter_value = EventParameterValue.new
  end

  # GET /event_parameter_values/1/edit
  def edit
  end

  # POST /event_parameter_values
  # POST /event_parameter_values.json
  def create
    @event_parameter_value = EventParameterValue.new(event_parameter_value_params)

    respond_to do |format|
      if @event_parameter_value.save
        format.html { redirect_to @event_parameter_value, notice: 'Event parameter value was successfully created.' }
        format.json { render :show, status: :created, location: @event_parameter_value }
      else
        format.html { render :new }
        format.json { render json: @event_parameter_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_parameter_values/1
  # PATCH/PUT /event_parameter_values/1.json
  def update
    respond_to do |format|
      if @event_parameter_value.update(event_parameter_value_params)
        format.html { redirect_to @event_parameter_value, notice: 'Event parameter value was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_parameter_value }
      else
        format.html { render :edit }
        format.json { render json: @event_parameter_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_parameter_values/1
  # DELETE /event_parameter_values/1.json
  def destroy
    @event_parameter_value.destroy
    respond_to do |format|
      format.html { redirect_to event_parameter_values_url, notice: 'Event parameter value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_parameter_value
      @event_parameter_value = EventParameterValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_parameter_value_params
      params.require(:event_parameter_value).permit(:event_parameter_id, :signup_id, :value)
    end
end
