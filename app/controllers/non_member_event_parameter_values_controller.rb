class NonMemberEventParameterValuesController < ApplicationController
  before_action :set_non_member_event_parameter_value, only: [:show, :edit, :update, :destroy]

  # GET /non_member_event_parameter_values
  # GET /non_member_event_parameter_values.json
  def index
    @non_member_event_parameter_values = NonMemberEventParameterValue.all
  end

  # GET /non_member_event_parameter_values/1
  # GET /non_member_event_parameter_values/1.json
  def show
  end

  # GET /non_member_event_parameter_values/new
  def new
    @non_member_event_parameter_value = NonMemberEventParameterValue.new
  end

  # GET /non_member_event_parameter_values/1/edit
  def edit
  end

  # POST /non_member_event_parameter_values
  # POST /non_member_event_parameter_values.json
  def create
    @non_member_event_parameter_value = NonMemberEventParameterValue.new(non_member_event_parameter_value_params)

    respond_to do |format|
      if @non_member_event_parameter_value.save
        format.html { redirect_to @non_member_event_parameter_value, notice: 'Non member event parameter value was successfully created.' }
        format.json { render :show, status: :created, location: @non_member_event_parameter_value }
      else
        format.html { render :new }
        format.json { render json: @non_member_event_parameter_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /non_member_event_parameter_values/1
  # PATCH/PUT /non_member_event_parameter_values/1.json
  def update
    respond_to do |format|
      if @non_member_event_parameter_value.update(non_member_event_parameter_value_params)
        format.html { redirect_to @non_member_event_parameter_value, notice: 'Non member event parameter value was successfully updated.' }
        format.json { render :show, status: :ok, location: @non_member_event_parameter_value }
      else
        format.html { render :edit }
        format.json { render json: @non_member_event_parameter_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /non_member_event_parameter_values/1
  # DELETE /non_member_event_parameter_values/1.json
  def destroy
    @non_member_event_parameter_value.destroy
    respond_to do |format|
      format.html { redirect_to non_member_event_parameter_values_url, notice: 'Non member event parameter value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_non_member_event_parameter_value
      @non_member_event_parameter_value = NonMemberEventParameterValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def non_member_event_parameter_value_params
      params.require(:non_member_event_parameter_value).permit(:event_parameter_id, :non_member_signup_id, :value)
    end
end
