class DocumentGroupCategory < ActiveRecord::Base
  has_many :document_groups

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 500 }
  validates :name_eng, length: { maximum: 500 }
  validates :name_eng, presence: true

  def get_name
    if I18n.locale == :en and self.name_eng
      return self.name_eng
    end
    self.name
  end
end
