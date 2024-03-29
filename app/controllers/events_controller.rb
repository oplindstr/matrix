class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy, :edit]
  before_action :set_signup, only: [:update_signup]
  before_action :set_locale, only: [:index, :past_events, :show]
  before_action :ensure_that_sub_admin, except: [:index, :show, :sign_up, :past_events, :ical, :ical_signup_starts]

  # GET /events
  # GET /events.json
  def index
    @text = Text.where('name = ?', 'Kalenteri').first
    @events = Event.all.where('starttime >= ?', DateTime.now.midnight).order(:starttime, :endtime)
  end

  def past_events
    @events = Event.all.where('starttime < ?', DateTime.now.midnight).order(starttime: :desc)
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
    @members = Member.all.order(:firstname, :lastname)

    respond_to do |format|
      format.html { render :new }
      format.json { render json: no_content }
    end
  end

  # GET /events/1/edit
  def edit
    @event_parameter_types = EventParameterType.all
    @members = Member.all.order(:firstname, :lastname)
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Tapahtuma lisätty' }
        format.json { render :show, status: :created, location: @event }
      else
        @alert = @event.errors
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
        format.html { redirect_to @event, notice: 'Tapahtuman muokkaus onnistui' }
        format.json { render :show, status: :ok, location: @event }
      else
        @event_parameter_types = EventParameterType.all
        @alert = @event.errors
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
      format.html { redirect_to events_url, notice: 'Tapahtuma poistettu' }
      format.json { head :no_content }
    end
  end

  def sign_up
    @signup = Signup.new(signup_params)

    if @signup.user_id and (!current_user or current_user.id != @signup.user_id)
       redirect_to root_path
    else
      respond_to do |format|
        if @signup.save
          format.html { redirect_to event_path(@signup.event_id), notice: 'Ilmoittautuminen onnistui!' }
          format.json { render :show, status: :created, location: event_path(@signup.event_id) }
        else
          @alert = @signup.errors
          @event = Event.find(@signup.event_id)
          @event_parameters = @event.event_parameters
          @action = 'sign_up'
          format.html { render :show }
          format.json { render json: @signup.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update_signup
    if !@signup.user_id and !sub_admin
      redirect_to root_path
    elsif @signup.user_id and (!current_user or current_user.id != @signup.user_id)
      redirect_to root_path
    else
      respond_to do |format|
        if @signup.update(signup_params)
          format.html { redirect_to event_path(@signup.event_id), notice: 'Ilmoittautumisen muokkaus onnistui' }
          format.json { render :show, status: :created, location: event_path(@signup.event_id) }
        else
          @alert = @signup.errors
          @event = Event.find(@signup.event_id)
          @event_parameters = @event.event_parameters
          @action = 'update_signup'
          format.html { render 'events/show'}
          format.json { render json: @signup.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def events_by_year
    @year = params[:year]
    @events = Event.all.order(:starttime).select{|m| m.starttime.year == @year.to_i }
  end

  def ical
    respond_to do |format|
      format.ics do
        @events = Event.all.where('starttime >= ?', DateTime.now.midnight).order(:starttime, :endtime)

        cal = Icalendar::Calendar.new

        @events.each do |event|
          new_event = Icalendar::Event.new
          new_event.dtstart = Icalendar::Values::DateTime.new(event.starttime)
          if event.endtime
            new_event.dtend = Icalendar::Values::DateTime.new(event.endtime)
          else
            new_event.dtend = event.starttime.advance(:hours => +2)
          end
          new_event.summary     = event.name
          new_event.description = event.descr
          new_event.location    = event.location
          new_event.url         = "#{kalenteri_url}/#{event.id}" 
          new_event.ip_class    = "PRIVATE"

          cal.add_event(new_event)
        end

        cal.publish

        render :plain => cal.to_ical
      end
    end
  end

  def ical_signup_starts
    respond_to do |format|
      format.ics do
        @midnight = DateTime.now.midnight
        @events = Event.all.where('starttime >= ? AND signup_start >= ?', @midnight, @midnight).order(:signup_start)

        cal = Icalendar::Calendar.new

        @events.each do |event|
          new_event = Icalendar::Event.new
          new_event.dtstart = Icalendar::Values::DateTime.new(event.signup_start)
          new_event.dtend = event.signup_start.advance(:hours => +1)

          new_event.summary     = "Ilmoittautuminen: #{event.name}"
          new_event.description = event.descr
          new_event.location    = event.location
          new_event.url         = "#{kalenteri_url}/#{event.id}" 
          new_event.ip_class    = "PRIVATE"

          cal.add_event(new_event)
        end

        cal.publish

        render :plain => cal.to_ical
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_locale
      @locale = I18n.locale
    end

    def set_signup
      @signup = Signup.find(params[:signup][:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:id, :name, :name_eng, :starttime, :endtime, :location, :event_type, :signup_required, :signup_start, :signup_end, :signup_cancellable_until, :descr, :descr_eng, :price, :signup_limit, :members_only, :participants, :contact_person_id, :event_parameters_attributes => [:id, :name, :name_eng, :event_parameter_type_id, :required, :_destroy, :event_parameter_choices_attributes => [:id, :value, :name_eng, :_destroy]])
    end

    def signup_params
      params.require(:signup).permit(:id, :user_id, :event_id, :name, :email, :phonenumber, :show, :signup_parameters_attributes => [:id, :event_parameter_id, :value])
    end

end
