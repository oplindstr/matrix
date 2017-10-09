class DocumentGroupCategory < ActiveRecord::Base

  has_many :document_groups
  validates :name, presence: true, uniqueness: true, length: { maximum: 500 }

end
