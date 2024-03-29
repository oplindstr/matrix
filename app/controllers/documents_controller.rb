class DocumentsController < ApplicationController
   before_action :ensure_that_sub_admin

   include MessageHelper
   @@object_type = 'document'
   
   def new
      @document = Document.new
      @document_group_id = params[:id]
      if not @document_group_id
         @document_groups = DocumentGroup.all.order(:name)
      else
         @document_group = DocumentGroup.find(@document_group_id)
      end
   end

   def edit
      @document = Document.find(params[:id])
      @document_groups = DocumentGroup.all.order(:name)
      @document_group_id = @document.document_group.id
   end
   
   def create
      @document = Document.new(document_params)
      @document_group = @document.document_group
      
      respond_to do |format|
         if @document.save
            format.html { redirect_to @document_group, notice: created_message(@@object_type) }
         else
            @alert = @document.errors
            @document_group_id = @document_group.id
            @document_groups = DocumentGroup.all.order(:name)
            format.html { render :new }
         end
      end
   end

   def update
      @document = Document.find(params[:id])
      @document_group = @document.document_group

      respond_to do |format|
         if @document.update(document_params)
            format.html { redirect_to @document_group, notice: updated_message(@@object_type) }
         else
            @alert = @document.errors
            @document_group_id = @document_group.id
            @document_groups = DocumentGroup.all.order(:name)
            format.html { render :edit }
         end
      end
   end
   
   def destroy
      @document = Document.find(params[:id])
      @document_group = @document.document_group
      @document.destroy
      redirect_to document_group_path(@document_group), notice: destroyed_message(@@object_type)
   end
   
   private
      def document_params
         params.require(:document).permit(:name, :attachment, :document_group_id, :name_eng)
      end
   
end
