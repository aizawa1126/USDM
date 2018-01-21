class Sheet < ApplicationRecord
  belongs_to :chapter
  has_many :sheet_pictures

  def self.search(specification_id, search)
    if search
      joins({:chapter => :specification})
     .where(['specifications.id == ? and sheets.content LIKE ?', specification_id, "%#{search}%"])
    else
      all
    end
  end

end
