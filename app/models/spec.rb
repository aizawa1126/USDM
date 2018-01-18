class Spec < ApplicationRecord
  belongs_to :function
  has_many :spec_keywords, dependent: :destroy
  has_many :keywords, through: :spec_keywords

  validates :number,
             presence: true,
             numericality: {
               only_integer: true,
               greater_than: 0
             },
             uniqueness: {:scope => :function_id}

  mount_uploader :picture, PictureUploader

  def self.search(specification_id, search)
    if search
      joins({:function => {:requirement => {:section => {:chapter => :specification}}}})
     .where(['specifications.id == ? and specs.content LIKE ?', specification_id, "%#{search}%"])
    else
      all
    end
  end
end
