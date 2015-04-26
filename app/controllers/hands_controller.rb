class HandsController < ApplicationController
  before_action :set_hand, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_activated

  # GET /hands
  # GET /hands.json
  def index
    @hands = Hand.all
  end

  # GET /hands/1
  # GET /hands/1.json
  def show
  end

  # GET /hands/new
  def new
    @hand = Hand.new
  end

  # GET /hands/1/edit
  def edit
  end

  # POST /hands
  # POST /hands.json
  def create
    @hand = Hand.new(hand_params)

    respond_to do |format|
      if @hand.save
        format.html { redirect_to @hand, notice: 'Hand was successfully created.' }
        format.json { render :show, status: :created, location: @hand }
      else
        format.html { render :new }
        format.json { render json: @hand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hands/1
  # PATCH/PUT /hands/1.json
  def update
    respond_to do |format|
      if @hand.update(hand_params)
        format.html { redirect_to @hand, notice: 'Hand was successfully updated.' }
        format.json { render :show, status: :ok, location: @hand }
      else
        format.html { render :edit }
        format.json { render json: @hand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hands/1
  # DELETE /hands/1.json
  def destroy
    @hand.destroy
    respond_to do |format|
      format.html { redirect_to hands_url, notice: 'Hand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hand
      @hand = Hand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hand_params
      params.require(:hand).permit(:match_id, :points1, :points2, :declarer, :bid, :contract, :made)
    end
end
