class NonMemberSignupsController < ApplicationController
  before_action :set_non_member_signup, only: [:show, :edit, :update, :destroy]

  # GET /non_member_signups
  # GET /non_member_signups.json
  def index
    @non_member_signups = NonMemberSignup.all
  end

  # GET /non_member_signups/1
  # GET /non_member_signups/1.json
  def show
  end

  # GET /non_member_signups/new
  def new
    @non_member_signup = NonMemberSignup.new
  end

  # GET /non_member_signups/1/edit
  def edit
  end

  # POST /non_member_signups
  # POST /non_member_signups.json
  def create
    @non_member_signup = NonMemberSignup.new(non_member_signup_params)

    respond_to do |format|
      if @non_member_signup.save
        format.html { redirect_to @non_member_signup, notice: 'Non member signup was successfully created.' }
        format.json { render :show, status: :created, location: @non_member_signup }
      else
        format.html { render :new }
        format.json { render json: @non_member_signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /non_member_signups/1
  # PATCH/PUT /non_member_signups/1.json
  def update
    respond_to do |format|
      if @non_member_signup.update(non_member_signup_params)
        format.html { redirect_to @non_member_signup, notice: 'Non member signup was successfully updated.' }
        format.json { render :show, status: :ok, location: @non_member_signup }
      else
        format.html { render :edit }
        format.json { render json: @non_member_signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /non_member_signups/1
  # DELETE /non_member_signups/1.json
  def destroy
    @non_member_signup.destroy
    respond_to do |format|
      format.html { redirect_to non_member_signups_url, notice: 'Non member signup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_non_member_signup
      @non_member_signup = NonMemberSignup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def non_member_signup_params
      params.require(:non_member_signup).permit(:event_id, :name, :email, :phonenumber)
    end
end
