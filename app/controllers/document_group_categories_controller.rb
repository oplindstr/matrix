class DocumentGroupCategoriesController < ApplicationController
  before_action :set_document_group_category, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_sub_admin, except: [:show]

  include MessageHelper

  @@object_type = 'document_category'

  # GET /document_group_categories/1
  # GET /document_group_categories/1.json
  def show
    @document_group_category_id = @document_group_category.id
    @document_groups = DocumentGroup.where('document_group_category_id = ?', @document_group_category_id).order(:name)
  end

  # GET /document_group_categories/new
  def new
    @document_group_category = DocumentGroupCategory.new
  end

  # GET /document_group_categories/1/edit
  def edit
  end

  # POST /document_group_categories
  # POST /document_group_categories.json
  def create
    @document_group_category = DocumentGroupCategory.new(document_group_category_params)

    respond_to do |format|
      if @document_group_category.save
        format.html { redirect_to @document_group_category, notice: created_message(@@object_type) }
        format.json { render :show, status: :created, location: @document_group_category }
      else
        @alert = @document_group_category.errors
        format.html { render :new }
        format.json { render json: @document_group_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_group_categories/1
  # PATCH/PUT /document_group_categories/1.json
  def update
    respond_to do |format|
      if @document_group_category.update(document_group_category_params)
        format.html { redirect_to @document_group_category, notice: updated_message(@@object_type) }
        format.json { render :show, status: :ok, location: @document_group_category }
      else
        @alert = @document_group_category.errors
        format.html { render :edit }
        format.json { render json: @document_group_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_group_categories/1
  # DELETE /document_group_categories/1.json
  def destroy
    @document_group_category.destroy
    respond_to do |format|
      format.html { redirect_to dokumentit_path, notice: destroyed_message(@@object_type) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_group_category
      @document_group_category = DocumentGroupCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_group_category_params
      params.require(:document_group_category).permit(:name, :name_eng)
    end
end
