class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if request.format.symbol != :json
      @signup = Signup.new
      if current_user and @event.user_signed_up(current_user.id)
        @signup = @event.getSignup(current_user.id)
      end
      if !current_user and !@event.members_only
        @non_member_signup = NonMemberSignup.new
        @non_member_signup.event_id = @event.id
      end
    end
    @events = Event.all
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def activities
    @years = Event.pluck(:starttime).uniq{ |m| m.year }.map!{ |m| m.year }
    render 'pages/toiminta'
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

  def events_by_year
    @year = params[:year]
    @events = Event.where("cast(strftime('%Y', starttime) as int) = ?", @year).order(:starttime)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      if request.format.symbol != :json
        @event = Event.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :starttime, :endtime, :location, :event_type, :signup_required, :signup_start, :signup_end, :signup_cancellable_until, :descr, :price, :signup_limit, :members_only)
    end
end
