class EventParameterChoicesController < ApplicationController
  before_action :set_event_parameter_choice, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_sub_admin

  # GET /event_parameter_choices
  # GET /event_parameter_choices.json
  def index
    @event_parameter_choices = EventParameterChoice.all
  end

  # GET /event_parameter_choices/1
  # GET /event_parameter_choices/1.json
  def show
  end

  # GET /event_parameter_choices/new
  def new
    @event_parameter_choice = EventParameterChoice.new
  end

  # GET /event_parameter_choices/1/edit
  def edit
  end

  # POST /event_parameter_choices
  # POST /event_parameter_choices.json
  def create
    @event_parameter_choice = EventParameterChoice.new(event_parameter_choice_params)

    respond_to do |format|
      if @event_parameter_choice.save
        format.html { redirect_to @event_parameter_choice, notice: 'Valintanapin vaihtoehto lisätty' }
        format.json { render :show, status: :created, location: @event_parameter_choice }
      else
        @alert = @event_parameter_choice.errors
        format.html { render :new }
        format.json { render json: @event_parameter_choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_parameter_choices/1
  # PATCH/PUT /event_parameter_choices/1.json
  def update
    respond_to do |format|
      if @event_parameter_choice.update(event_parameter_choice_params)
        format.html { redirect_to @event_parameter_choice, notice: 'Valintanapin vaihtoehdon muokkaus onnistui' }
        format.json { render :show, status: :ok, location: @event_parameter_choice }
      else
        @alert = @event_parameter_choice.errors
        format.html { render :edit }
        format.json { render json: @event_parameter_choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_parameter_choices/1
  # DELETE /event_parameter_choices/1.json
  def destroy
    @event_parameter_choice.destroy
    respond_to do |format|
      format.html { redirect_to event_parameter_choices_url, notice: 'Valintanapin vaihtoehto poistettu' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_parameter_choice
      @event_parameter_choice = EventParameterChoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_parameter_choice_params
      params.require(:event_parameter_choice).permit(:event_parameter_id, :value, :name_eng)
    end
end
