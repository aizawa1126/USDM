class Section < ApplicationRecord
  belongs_to :chapter
  has_many :requirements, dependent: :destroy

  validates :number,
             presence: true,
             numericality: {
               only_integer: true,
               greater_than: 0
             },
             uniqueness: {:scope => :chapter_id}

  validates :name,
             presence: true,
             uniqueness: {:scope => :chapter_id}
end
