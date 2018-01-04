class DocumentsController < ApplicationController
   
   def new
      @document = Document.new
      @document_group_id = params[:id]
      if not @document_group_id
         @document_groups = DocumentGroup.all.order(:name)
      end
   end
   
   def create
      @document = Document.new(document_params)
      @document_group = @document.document_group
      
      respond_to do |format|
         if @document.save
            format.html { redirect_to @document_group, notice: 'Document was successfully created.' }
         else
            @document_group_id = @document_group.id
            format.html { render :new }
         end
      end
   end
   
   def destroy
      @document = Document.find(params[:id])
      @document_group = @document.document_group
      @document.destroy
      redirect_to document_group_path(@document_group), notice:  "The document #{@document.name} has been deleted."
   end
   
   private
      def document_params
         params.require(:document).permit(:name, :attachment, :document_group_id)
      end
   
end
