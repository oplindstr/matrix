class Document < ActiveRecord::Base
   mount_uploader :attachment, AvatarUploader # Tells rails to use this uploader for this model.
   validates :name, presence: true
   validates :attachment, presence: true

   belongs_to :document_group
end