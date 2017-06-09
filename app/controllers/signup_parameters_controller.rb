class SignupParametersController < ApplicationController
  before_action :set_signup_parameter, only: [:show, :edit, :update, :destroy]

  # GET /signup_parameters
  # GET /signup_parameters.json
  def index
    @signup_parameters = SignupParameter.all
  end

  # GET /signup_parameters/1
  # GET /signup_parameters/1.json
  def show
  end

  # GET /signup_parameters/new
  def new
    @signup_parameter = SignupParameter.new
  end

  # GET /signup_parameters/1/edit
  def edit
  end

  # POST /signup_parameters
  # POST /signup_parameters.json
  def create
    @signup_parameter = SignupParameter.new(signup_parameter_params)

    respond_to do |format|
      if @signup_parameter.save
        format.html { redirect_to @signup_parameter, notice: 'Signup parameter was successfully created.' }
        format.json { render :show, status: :created, location: @signup_parameter }
      else
        format.html { render :new }
        format.json { render json: @signup_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signup_parameters/1
  # PATCH/PUT /signup_parameters/1.json
  def update
    respond_to do |format|
      if @signup_parameter.update(signup_parameter_params)
        format.html { redirect_to @signup_parameter, notice: 'Signup parameter was successfully updated.' }
        format.json { render :show, status: :ok, location: @signup_parameter }
      else
        format.html { render :edit }
        format.json { render json: @signup_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signup_parameters/1
  # DELETE /signup_parameters/1.json
  def destroy
    @signup_parameter.destroy
    respond_to do |format|
      format.html { redirect_to signup_parameters_url, notice: 'Signup parameter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup_parameter
      @signup_parameter = SignupParameter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signup_parameter_params
      params.require(:signup_parameter).permit(:signup_id, :event_parameter_id, :value)
    end
end
