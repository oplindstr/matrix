class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_admin, except: [:index, :create, :update]
  before_action :ensure_that_activated, only: [:create, :update]

  # GET /players
  # GET /players.json
  def index
    set_page_params
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
    @users = User.all
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)
    if not (current_user and !current_user.player)
      @player.user_id = nil
    end

    respond_to do |format|
      if @player.save
        format.html { redirect_to jatkantappajat_path, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: jatkantappajat_path }
      else
        set_page_params
        format.html { render :index }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to current_user, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :expectation, :deviation, :private, :user_id)
    end

    def set_page_params
      if current_user and current_user.id == 9
        @players = Player.where("id >= 62")
      else
        @players = Player.all
      end
      @players_ordered_by_name = @players
      @players_ordered_by_name = @players_ordered_by_name.sort_by{ |b| b.name }
      order = params[:order] || 'assurity'
      @players = case order
                   when 'name' then @players.sort_by{ |b| b.name }
                   when 'expectation' then @players.sort_by{ |b| b.expectation }.reverse
                   when 'deviation' then @players.sort_by{ |b| b.deviation }.reverse
                   when 'assurity' then @players.sort_by{ |b| b.expectation - 3*b.deviation }.reverse
                 end
      @player = Player.new if !@player
      @match = Match.new
    end
end
