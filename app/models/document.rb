class Document < ActiveRecord::Base
   belongs_to :document_group

   validates :name, presence: true, length: { maximum: 500 }
   
   mount_uploader :attachment, DocumentUploader
   validates_presence_of :attachment

   validate :unique_name_in_group

   def unique_name_in_group
   	@documents = Document.where("name = ? and document_group_id = ?", self.name, self.document_group_id)
   	if @documents.size > 0
   	  errors.add(:name, "Tässä ryhmässä on jo tämän niminen dokumentti")
   	 end
   end
end