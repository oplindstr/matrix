class StringresourcesController < ApplicationController
  before_action :set_stringresource, only: [:show, :edit, :update, :destroy]

  # GET /stringresources
  # GET /stringresources.json
  def index
    @stringresources = Stringresource.all
  end

  # GET /stringresources/1
  # GET /stringresources/1.json
  def show
  end

  # GET /stringresources/new
  def new
    @stringresource = Stringresource.new
  end

  # GET /stringresources/1/edit
  def edit
  end

  # POST /stringresources
  # POST /stringresources.json
  def create
    @stringresource = Stringresource.new(stringresource_params)

    respond_to do |format|
      if @stringresource.save
        format.html { redirect_to @stringresource, notice: 'Stringresource was successfully created.' }
        format.json { render :show, status: :created, location: @stringresource }
      else
        format.html { render :new }
        format.json { render json: @stringresource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stringresources/1
  # PATCH/PUT /stringresources/1.json
  def update
    respond_to do |format|
      if @stringresource.update(stringresource_params)
        format.html { redirect_to @stringresource, notice: 'Stringresource was successfully updated.' }
        format.json { render :show, status: :ok, location: @stringresource }
      else
        format.html { render :edit }
        format.json { render json: @stringresource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stringresources/1
  # DELETE /stringresources/1.json
  def destroy
    @stringresource.destroy
    respond_to do |format|
      format.html { redirect_to stringresources_url, notice: 'Stringresource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stringresource
      @stringresource = Stringresource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stringresource_params
      params.require(:stringresource).permit(:key, :value)
    end
end
