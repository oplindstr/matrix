class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :set_signup, only: [:update_signup]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.where('starttime > ?', Time.now).order(:starttime)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if request.format.symbol != :json
      @events = Event.all
      @event_parameters = @event.event_parameters
      @signup = Signup.new
      if current_user and @event.user_signed_up(current_user.id)
        @signup = @event.getSignup(current_user.id)
        @action = 'update_signup'
      else
        @signup_parameters = []
        @event_parameters.each do |param|
          @signup.signup_parameters.build(event_parameter_id: param.id)
        end
        @action = 'sign_up'
      end
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    @event_parameter_types = EventParameterType.all

    respond_to do |format|
      format.html { render :new }
      format.json { render json: no_content }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @event_parameter_types = EventParameterType.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)


    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        @event_parameter_types = EventParameterType.all
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sign_up
    @signup = Signup.new(signup_params)

    respond_to do |format|
      if @signup.save
        format.html { redirect_to event_path(@signup.event_id), notice: 'Ilmoittautuminen onnistui!' }
        format.json { render :show, status: :created, location: event_path(@signup.event_id) }
      else
        @event = Event.find(@signup.event_id)
        @event_parameters = @event.event_parameters
        @action = 'sign_up'
        format.html { render :show }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_signup
    respond_to do |format|
      if @signup.update(signup_params)
        format.html { redirect_to event_path(@signup.event_id), notice: 'Ilmoittautumisen muokkaus onnistui' }
        format.json { render :show, status: :created, location: event_path(@signup.event_id) }
      else
        @event = Event.find(@signup.event_id)
        @event_parameters = @event.event_parameters
        @action = 'update_signup'
        format.html { render 'events/show'}
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  def events_by_year
    @year = params[:year]
    @events = Event.all.order(:starttime).select{|m| m.starttime.year == @year.to_i }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      if request.format.symbol != :json
        @event = Event.find(params[:id])
      end
    end

    def set_signup
      if request.format.symbol != :json
        @signup = Signup.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:id, :name, :starttime, :endtime, :location, :event_type, :signup_required, :signup_start, :signup_end, :signup_cancellable_until, :descr, :price, :signup_limit, :members_only, :event_parameters_attributes => [:id, :name, :event_parameter_type_id, :required, :_destroy, :event_parameter_choices_attributes => [:id, :value, :_destroy]])
    end

    def signup_params
      params.require(:signup).permit(:id, :user_id, :event_id, :name, :email, :phonenumber, :signup_parameters_attributes => [:id, :event_parameter_id, :value])
    end

end
