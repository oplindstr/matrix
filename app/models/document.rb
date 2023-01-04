class Document < ActiveRecord::Base
   belongs_to :document_group

   validates :name, presence: true
   validates :name, length: { maximum: 500 }

   mount_uploader :attachment, DocumentUploader
   validates :attachment, presence: true

   validate :unique_name_in_group

   def unique_name_in_group
   	@documents = Document.where("document_group_id = ? and name = ?", self.document_group_id, self.name)
   	if @documents.size > 0
   	   errors.add(:name, I18n.t('duplicate_document_message'))
   	end
   end

   def get_name
      if I18n.locale == :en and self.name_eng
         return self.name_eng
      end
      return self.name
   end
end