class DocumentGroup < ActiveRecord::Base

  has_many :documents
  belongs_to :document_group_category
  validates :name, presence: true, uniqueness: true, length: { maximum: 500 }
  validates :display_name, length: { maximum: 500 }

  def to_s
  	if self.display_name
  	  self.display_name
    else
      self.name
    end
  end

  def url
    self.name.tr(' ', '+')
  end

end
