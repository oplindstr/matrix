class DocumentGroupsController < ApplicationController
  before_action :set_document_group, only: [:edit, :update, :destroy, :show]
  before_action :set_document_group_categories, only: [:index, :new]
  before_action :ensure_that_sub_admin, except: [:index, :show]

  include MessageHelper
  @@object_type = 'document_group'

  # GET /document_groups
  # GET /document_groups.json
  def index
    @document_groups = DocumentGroup.all.sort { |a,b| 
      if a.to_s.match('^[0-9]*$') and b.to_s.match('^[0-9]*$')
        b.to_s <=> a.to_s 
      else
        a.to_s <=> b.to_s 
      end
    }
  end

  # GET /document_groups/1
  # GET /document_groups/1.json
  def show
    @documents = @document_group.documents.sort { |a,b| a.name <=> b.name }
    @document_group_id = @document_group.id
  end

  # GET /document_groups/new
  def new
    @document_group = DocumentGroup.new
    @document_group_category_id = params[:id]
    @document_group_category = DocumentGroupCategory.find(@document_group_category_id)
  end

  # GET /document_groups/1/edit
  def edit
    @document_group_category_id = @document_group.document_group_category_id
    @document_group_categories = DocumentGroupCategory.all.sort { |a,b| a.name.downcase <=> b.name.downcase }
  end

  # POST /document_groups
  # POST /document_groups.json
  def create
    @document_group = DocumentGroup.new(document_group_params)

    respond_to do |format|
      if @document_group.save
        format.html { redirect_to document_group_page_path(@document_group.name.tr(' ', '+')), notice: created_message(@@object_type) }
        format.json { render :show, status: :created, location: @document_group }
      else
        @document_group_categories = DocumentGroupCategory.all.sort { |a,b| a.name.downcase <=> b.name.downcase }
        @document_group_category_id = @document_group.document_group_category_id
        if @document_group_category_id
          @document_group_category = DocumentGroupCategory.find(@document_group_category_id)
        end
        @alert = @document_group.errors
        format.html { render :new }
        format.json { render json: @document_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_groups/1
  # PATCH/PUT /document_groups/1.json
  def update
    respond_to do |format|
      if @document_group.update(document_group_params)
        format.html { redirect_to document_group_page_path(@document_group.name.tr(' ', '+')), notice: updated_message(@@object_type) }
        format.json { render :show, status: :ok, location: @document_group }
      else
        @document_group_categories = DocumentGroupCategory.all.sort { |a,b| a.name.downcase <=> b.name.downcase }
        @alert = @document_group.errors
        format.html { render :edit }
        format.json { render json: @document_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_groups/1
  # DELETE /document_groups/1.json
  def destroy
    @document_group.destroy
    respond_to do |format|
      format.html { redirect_to dokumentit_path, notice: destroyed_message(@@object_type) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_group
      if params[:name]
        @document_group = DocumentGroup.where("name = ?", params[:name].tr('+', ' ')).first
      else
        @document_group = DocumentGroup.find(params[:id])
      end
      if not @document_group
        redirect_to '/dokumentit'
      end
    end

    def set_document_group_categories
      @document_group_categories = DocumentGroupCategory.where('name != ?', 'Tenttiarkisto').sort { |a,b| a.name.downcase <=> b.name.downcase }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_group_params
      params.require(:document_group).permit(:name, :display_name, :document_group_category_id, :display_name_eng)
    end
end
