class SignupsController < ApplicationController
  before_action :set_signup, only: [:edit, :update, :destroy]
  before_action :set_event, only: [:show]

  # GET /signups
  # GET /signups.json
  def index
    @signups = Signup.all
  end

  # GET /signups/1
  # GET /signups/1.json
  def show
    @signups = @event.signups
    @signup_count = 1
    @events = Event.all
  end

  # GET /signups/new
  def new
    @signup = Signup.new
  end

  # GET /signups/1/edit
  def edit
  end

  # POST /signups
  # POST /signups.json
  def create
    @signup = Signup.new(signup_params)

    respond_to do |format|
      if @signup.save
        format.html { redirect_to event_path(@signup.event_id), notice: 'Ilmoittautuminen onnistui!' }
        format.json { render :show, status: :created, location: event_path(@signup.event_id) }
      else
        @event = Event.find(@signup.event_id)
        @event_parameters = @event.event_parameters
        format.html { render 'events/show'}
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signups/1
  # PATCH/PUT /signups/1.json
  def update
    respond_to do |format|
      if @signup.update(signup_params)
        format.html { redirect_to event_path(@signup.event_id), notice: 'Ilmoittautumisen muokkaus onnistui' }
        format.json { render :show, status: :created, location: event_path(@signup.event_id) }
      else
        @event = Event.find(@signup.event_id)
        @event_parameters = @event.event_parameters
        format.html { render 'events/show'}
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signups/1
  # DELETE /signups/1.json
  def destroy
    event_id = @signup.event_id
    @signup.destroy
    respond_to do |format|
      format.html { redirect_to event_path(event_id), notice: 'Ilmoittautuminen peruttu onnistuneesti' }
      format.json { head :no_content }
    end
  end

  private

    def set_event
      if request.format.symbol != :json
        @event = Event.find(params[:id])
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_signup
      if request.format.symbol != :json
        @signup = Signup.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signup_params
      params.require(:signup).permit(:id, :user_id, :event_id, :name, :email, :signup_parameters_attributes => [:id, :event_parameter_id, :value])
    end
end
