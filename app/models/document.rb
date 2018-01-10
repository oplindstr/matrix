class Document < ActiveRecord::Base
   belongs_to :document_group

   validates :name, presence: { message: 'Nimi puuttuu' }
   validates :name, length: { maximum: 500, 'Anna nimi, jonka pituus on enintään 500 merkkiä' }

   mount_uploader :attachment, DocumentUploader
   validates :attachment, presence: { message: 'Tiedosto puuttuu' }

   validate :unique_name_in_group

   def unique_name_in_group
   	@documents = Document.where("name = ? and document_group_id = ?", self.name, self.document_group_id)
   	if @documents.size > 0
   	  errors.add(:name, "Tässä ryhmässä on jo tämän niminen dokumentti")
   	 end
   end
end