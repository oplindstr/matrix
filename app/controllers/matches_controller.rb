class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  def ongoing
    @matches = Match.where(winners:0)
    @ongoing = 1
    render :index
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @declarers = @match.players
    @declarers.push(Player.new(id:nil, name:"-"))
    @match.hands.build
  end

  # GET /matches/new
  def new
    @players = Player.all.sort_by{|b| b.name}
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        if @match.winners != 0
          @match.update_players
          format.html { redirect_to jatkantappajat_path, notice: 'Result was successfully saved.' }
          format.json { render :index, status: :created, location: jatkantappajat_path }
        else
          format.html { redirect_to @match, notice: 'Match was successfully created.' }
          format.json { render :show, status: :created, location: @match }
        end
      else
        format.html { redirect_to :back, alert: 'Pelaajat väärin' }
        format.json { render :index, json: @match.errors, status: :unprocessable_entity, location: :back}
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def hands_update
    params.permit["winners"]
    params["match"]["hands_attributes"].permit!
    hands = params["match"]["hands_attributes"]
    @winners = params["winners"];
    
    @match_id = params["match"]["hands_attributes"].first[1]["match_id"]
    if @match_id.nil?
      redirect_to jatkantappajat_path
    end

    respond_to do |format|
      hands.each do |hand|
        hand_params = hand[1]
        destroy = hand_params["_destroy"]
         hand_params.delete(:_destroy)
         @newhand = Hand.new(hand_params)
         if @newhand.id
           @existinghand = Hand.find(@newhand.id)
           if destroy == "1"
             @existinghand.destroy
           else
             if !@existinghand.update(hand_params)
               format.html { render :show }
               format.json { render json: @match.errors, status: :unprocessable_entity }
             end
           end
         else
           if destroy == "false"
             if !@newhand.save
               format.html { render :show }
               format.json { render json: @match.errors, status: :unprocessable_entity }
             end
           end
         end
      end

      @match = Match.find(@match_id)
      @match.winners = @winners
      if @match.save and @winners != 0
        @match.update_players
      end
      format.html { redirect_to jatkantappajat_path, notice: 'Match was successfully saved.' }
      format.json { render jatkantappajat_path, status: :ok }
    end

  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:player1, :player2, :player3, :player4, :winners, :hands_attributes)
    end
end
