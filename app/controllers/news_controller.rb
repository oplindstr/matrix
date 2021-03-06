class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_sub_admin

  # GET /news
  # GET /news.json
  def index
    @news = News.all.order(priority: :desc, id: :desc)
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to news_index_path, notice: 'Uutinen lisätty' }
        format.json { render :index, status: :created, location: news_index_path }
      else
        @alert = @news.errors
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to news_index_path, notice: 'Uutisen päivitys onnistui' }
        format.json { render :index, status: :ok, location: news_index_path }
      else
        @alert = @news.errors
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_path, notice: 'Uutinen poistettu' }
      format.json { render :index, status: :ok, location: news_index_path }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:text, :header, :priority)
    end
end
