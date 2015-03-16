class HpStatisticsController < ApplicationController
  before_action :set_hp_statistic, only: [:show, :edit, :update, :destroy]

  # GET /hp_statistics
  # GET /hp_statistics.json
  def index
    @hp_statistics = HpStatistic.all
  end

  # GET /hp_statistics/1
  # GET /hp_statistics/1.json
  def show
  end

  # GET /hp_statistics/new
  def new
    @users = User.all
    @hp_statistic = HpStatistic.new
  end

  # GET /hp_statistics/1/edit
  def edit
  end

  # POST /hp_statistics
  # POST /hp_statistics.json
  def create
    @hp_statistic = HpStatistic.new(hp_statistic_params)

    respond_to do |format|
      if @hp_statistic.save
        format.html { redirect_to @hp_statistic, notice: 'Hp statistic was successfully created.' }
        format.json { render :show, status: :created, location: @hp_statistic }
      else
        format.html { render :new }
        format.json { render json: @hp_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hp_statistics/1
  # PATCH/PUT /hp_statistics/1.json
  def update
    respond_to do |format|
      if @hp_statistic.update(hp_statistic_params)
        format.html { redirect_to @hp_statistic, notice: 'Hp statistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @hp_statistic }
      else
        format.html { render :edit }
        format.json { render json: @hp_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hp_statistics/1
  # DELETE /hp_statistics/1.json
  def destroy
    @hp_statistic.destroy
    respond_to do |format|
      format.html { redirect_to hp_statistics_url, notice: 'Hp statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hp_statistic
      @hp_statistic = HpStatistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hp_statistic_params
      params.require(:hp_statistic).permit(:u_id, :expectation, :deviation, :assurity)
    end
end
