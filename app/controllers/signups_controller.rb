class SignupsController < ApplicationController
  before_action :set_signup, only: [:edit, :update, :destroy, :delete]
  before_action :set_event, only: [:show]
  before_action :ensure_that_sub_admin, except: [:create, :update, :destroy, :show]

  # GET /signups
  # GET /signups.json
  def index
    @signups = Signup.all.order(:id)
  end

  # GET /signups/1
  # GET /signups/1.json
  def show
    if !sub_admin and (!@event.signup_required or !@event.signup_open)
      redirect_to root_path
    else
      @signups = @event.signups.order(:id).includes([:signup_parameters, :user])
      @signup_limit = @event.signup_limit
      if @signup_limit and @signups.size > @signup_limit
        @reserve = @signups.last(@signups.size - @signup_limit)
        @signups = @signups.first(@signup_limit)
      end
      @signup_count = 1
    end
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

    @event = Event.find(@signup.event_id)

    if @signup.user_id and (!current_user or current_user.id != @signup.user_id)
       redirect_to root_path
    elsif !@event.signup_open
       redirect_to root_path
    else
      respond_to do |format|
        if @signup.save
          format.html { redirect_to event_path(@signup.event_id), notice: 'Ilmoittautuminen onnistui!' }
          format.json { render :show, status: :created, location: event_path(@signup.event_id) }
        else
          @alert = @signup.errors
          @event_parameters = @event.event_parameters
          format.html { render 'events/show'}
          format.json { render json: @signup.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /signups/1
  # PATCH/PUT /signups/1.json
  def update
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
          format.html { render 'events/show'}
          format.json { render json: @signup.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /signups/1
  # DELETE /signups/1.json
  def destroy
    if !@signup.user_id and !sub_admin
      redirect_to root_path
    elsif @signup.user_id and (!current_user or current_user.id != @signup.user_id)
      redirect_to root_path
    else
      @event_id = @signup.event_id
      @user = User.find(@signup.user_id)
      if @user
        ensure_that_current_user
      end
      @signup.destroy
      respond_to do |format|
        format.html { redirect_to event_path(@event_id), notice: 'Ilmoittautuminen peruttu' }
        format.json { head :no_content }
      end
    end
  end

  def delete
	event_id = @signup.event_id
    @signup.destroy
    respond_to do |format|
    format.html { redirect_to event_signups_path(event_id), notice: 'Ilmoittautuminen poistettu' }
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
