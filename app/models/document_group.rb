class DocumentGroup < ActiveRecord::Base
  has_many :documents
  belongs_to :document_group_category

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 500 }
  validates :display_name, length: { maximum: 500 }
  validate :name_for_url

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

  def name_for_url
    if !self.name.match(/[^a-zA-Z0-9äöÄÖ\s]$/).nil?
      errors.add(:name, I18n.t('only_numbers_in_name_allowed'))
    end
  end

  def get_name
    if I18n.locale == :en and self.display_name_eng
      return self.display_name_eng
    end
    if self.display_name
      return self.display_name
    end
    self.name
  end
end
